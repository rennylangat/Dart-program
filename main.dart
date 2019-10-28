import 'dart:html';
import 'dart:math' show pi;

CanvasElement canvas;
CanvasRenderingContext2D ctx;

const double RADIUS = 15.0;

class Ball {
  double radius;
  double startX = 50;
  double startY = 50;
  double velocityX = 0;
  double velocityY = 0;
  Ball(double radius) {
    radius;
  }
}
void main() {
  canvas = querySelector('#surface');

  var ball = new Ball(RADIUS);

  void doMouseDown(event) {
    ball.startX = event.pageX;
    ball.startY = event.pageY;
  }

  canvas.addEventListener("mousedown", doMouseDown);
  ctx = canvas.getContext('2d');

  void draw(num time) {
    ctx.save();
    ctx.fillStyle = "rgba(200, 0, 200, .3)";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.restore();

    ball.startX += ball.velocityX;
    ball.startY += ball.velocityY;
    ball.velocityX *= .99;
    ball.velocityY *= .99;
    ball.velocityY += .25;
    ball.velocityX += .25;
    if (ball.startY + ball.radius > canvas.height) {
      ball.startY = canvas.height - ball.radius;
      ball.velocityY = -(ball.velocityY).abs();
    };
    if (ball.startX + ball.radius > canvas.width) {
      ball.startX = canvas.width - ball.radius;
      ball.velocityX = -(ball.velocityX).abs();
    };
    ctx.save();
    ctx.translate(ball.startX, ball.startY);
    ctx.fillStyle = "#ffff00";
    ctx.beginPath();
    ctx.arc(0, 0, ball.radius, 0, pi * 2, true);
    ctx.closePath();
    ctx.fill();
    ctx.restore();
  };
  window.requestAnimationFrame(draw);
}

