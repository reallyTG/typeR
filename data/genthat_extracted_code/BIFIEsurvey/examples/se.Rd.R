library(BIFIEsurvey)


### Name: se
### Title: Standard Errors of Estimated Parameters
### Aliases: se

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example with lm function
#############################################################################

set.seed(906)
N <- 100
x <- seq(0,1,length=N)
y <- .6*x + stats::rnorm(N, sd =1)
mod <- stats::lm( y ~ x )
coef(mod)
vcov(mod)
se(mod)
summary(mod)



