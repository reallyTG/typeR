library(Dark)


### Name: P7c
### Title: Seven parameter model
### Aliases: P7c
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(1234)
x <- 0:20
a <- c(-1.00,  1.00,  1.00, -0.24,  6.00,  0.20, 13.00)
tmp <- TestData(x, a)
y <- tmp$resid
# P7c(TRUE)
# Describes the model

# P7c(a)
# The sum of squared residuals

# P7c(a,x)
# The fitted thresholds for given parameters 'a' and times 'x'




