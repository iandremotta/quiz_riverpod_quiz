import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> answers;

  Question(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    answers = json['incorrect_answers'].cast<String>();
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Question(
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? '',
      question: map['question'] ?? '',
      correctAnswer: map['correct_answer'] ?? '',
      answers: List<String>.from(map['incorrect_answers'] ?? [])
        ..add(map['correct_answer'] ?? '')
        ..shuffle(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.answers;
    return data;
  }

  @override
  List<Object> get props =>
      [category, difficulty, question, correctAnswer, answers];
}
