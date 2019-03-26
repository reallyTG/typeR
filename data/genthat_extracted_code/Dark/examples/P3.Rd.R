library(Dark)


### Name: P3
### Title: Three parameter model.
### Aliases: P3
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(1234)
x <- 0:20
a <- c(-1.00,  1.00,  1.00, -0.24,  6.00,  0.20, 13.00)
tmp <- TestData(x, a)
y <- tmp$resid
P3(TRUE)
# Describes the model

P3(a)
# The sum of squared residuals

P3(a,x)
# The fitted thresholds for given parameters 'theta' and times 'x'




