library(matlib)


### Name: showEqn
### Title: Show Matrices (A, b) as Linear Equations
### Aliases: showEqn

### ** Examples

  A <- matrix(c(2, 1, -1,
               -3, -1, 2,
               -2,  1, 2), 3, 3, byrow=TRUE)
  b <- c(8, -11, -3)
  showEqn(A, b)
  # show numerically
  x <- solve(A, b)
  showEqn(A, b, vars=x)

  showEqn(A, b, simplify=TRUE)
  showEqn(A, b, latex=TRUE)

  # lower triangle of equation with zeros omitted (for back solving)
  A <- matrix(c(2, 1, 2,
               -3, -1, 2,
               -2,  1, 2), 3, 3, byrow=TRUE)
  U <- LU(A)$U
  showEqn(U, simplify=TRUE, fractions=TRUE)
  showEqn(U, b, simplify=TRUE, fractions=TRUE)

  ####################
  # Linear models Design Matricies
  data(mtcars)
  ancova <- lm(mpg ~ wt + vs, mtcars)
  summary(ancova)
  showEqn(ancova)
  showEqn(ancova, simplify=TRUE)
  showEqn(ancova, vars=round(coef(ancova),2))
  showEqn(ancova, vars=round(coef(ancova),2), simplify=TRUE)

  twoway_int <- lm(mpg ~ vs * am, mtcars)
  summary(twoway_int)
  car::Anova(twoway_int)
  showEqn(twoway_int)
  showEqn(twoway_int, reduce=TRUE)
  showEqn(twoway_int, reduce=TRUE, simplify=TRUE)

  # Piece-wise linear regression
  x <- c(1:10, 13:22)
  y <- numeric(20)
  y[1:10] <- 20:11 + rnorm(10, 0, 1.5)
  y[11:20] <- seq(11, 15, len=10) + rnorm(10, 0, 1.5)
  plot(x, y, pch = 16)

  x2 <- as.numeric(x > 10)
  mod <- lm(y ~ x + I((x - 10) * x2))
  summary(mod)
  lines(x, fitted(mod))
  showEqn(mod)
  showEqn(mod, vars=round(coef(mod),2))
  showEqn(mod, simplify=TRUE)




