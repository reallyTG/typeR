library(epibasix)


### Name: epiTTest
### Title: Epidemiological T-Test Function
### Aliases: epiTTest print.epiTTest summary.epiTTest
### Keywords: multivariate htest

### ** Examples

X <- rnorm(100,10,1);
Y <- rnorm(100);
summary(epiTTest(X,Y, pooled = FALSE));



