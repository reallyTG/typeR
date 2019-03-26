library(Dark)


### Name: P5c
### Title: Five parameter model.
### Aliases: P5c
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(1234)
x <- 0:20
a <- c(-1.00,  1.00,  1.00, -0.24,  6.00,  0.20, 13.00)
tmp <- TestData(x, a)
y <- tmp$resid
P5c(TRUE)
# Describes the model

P5c(a)
# The sum of squared residuals

P5c(a,x)
# The fitted thresholds for given parameters 'theta' and times 'x'




