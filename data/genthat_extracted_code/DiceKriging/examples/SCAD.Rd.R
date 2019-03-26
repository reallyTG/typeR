library(DiceKriging)


### Name: SCAD
### Title: Penalty function
### Aliases: SCAD
### Keywords: models htest

### ** Examples
 
x <- seq(-8,8, length=200)
a <- 3.7

lambda <- 1.5
y <- SCAD(x, lambda)
plot(x, y, type="l", ylim=c(0,6))
x.knots <- c(-a*lambda, -lambda, 0, lambda, a*lambda)
points(x.knots, SCAD(x.knots, lambda), pch=19, cex=0.5)
text(6, SCAD(6, lambda)+0.3, paste("lambda =", lambda))

for (i in 1:2) {
   lambda <- lambda - 0.5
   y <- SCAD(x, lambda)
   lines(x, y, type="l")
   x.knots <- c(-a*lambda, -lambda, 0, lambda, a*lambda)
   points(x.knots, SCAD(x.knots, lambda), pch=19, cex=0.5)
   text(6, SCAD(6, lambda)+0.3, paste("lambda =", lambda))
}

abline(v=0, h=0, lty="dotted")
title("SCAD function")



