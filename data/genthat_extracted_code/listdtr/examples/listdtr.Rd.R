library(listdtr)


### Name: listdtr
### Title: Estimation of List-based Optimal Dynamic Treatment Regime
### Aliases: listdtr
### Keywords: tree

### ** Examples

  
  # an example for one-stage study
  x <- matrix(rnorm(500), 100, 5)
  stage.x <- rep(1, 5)
  a <- rbinom(100, 1, 0.5)
  y <- a * x[, 1] + rnorm(100, 0, 0.1)
  dtr <- listdtr(y, a, x, stage.x)
  
  dtr                # display the regime in words
  plot(dtr)          # display the regime in diagrams
  yrec <- predict(dtr, x, 1)
  yopt <- ifelse(x[, 1] > 0, 1, 0)
  table(yrec, yopt)  # discrepancy between recommended and optimal

  # an example for two-stage study
  x <- matrix(rnorm(500), 100, 5)
  stage.x <- c(1, 1, 1, 2, 2)
  a1 <- rbinom(100, 1, 0.5)
  a2 <- rbinom(100, 1, 0.5)
  y1 <- rep(0, 100)
  y2 <- 9 * a1 * sin(x[, 1] * pi / 8) - 2 * a2 * x[, 4] + rnorm(100)
  dtr <- listdtr(cbind(y1, y2), cbind(a1, a2), x, stage.x)
  
  dtr                # display the regime in words
  plot(dtr)          # display the regime in diagrams
  yrec <- predict(dtr, x, 1)
  yopt <- ifelse(x[, 1] > 0, 1, 0)
  table(yrec, yopt)  # discrepancy between recommended and optimal




