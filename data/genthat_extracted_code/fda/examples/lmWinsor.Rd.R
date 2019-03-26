library(fda)


### Name: lmWinsor
### Title: Winsorized Regression
### Aliases: lmWinsor
### Keywords: models

### ** Examples

# example from 'anscombe'
lm.1 <- lmWinsor(y1~x1, data=anscombe)

# no leverage to estimate the slope
lm.1.5 <- lmWinsor(y1~x1, data=anscombe, trim=0.5)

# test nonlinear optimization
lm.1.25 <- lmWinsor(y1~x1, data=anscombe, trim=0.25)

# list example
lm.1. <- lmWinsor(y1~x1, data=anscombe, trim=c(0, 0.25, .4, .5))




