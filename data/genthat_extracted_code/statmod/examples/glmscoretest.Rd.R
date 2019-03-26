library(statmod)


### Name: glm.scoretest
### Title: Score Test for Adding a Covariate to a GLM
### Aliases: glm.scoretest
### Keywords: regression

### ** Examples

#  Pearson's chisquare test for independence
#  in a contingency table is a score test.

#  First the usual test

y <- c(20,40,40,30)
chisq.test(matrix(y,2,2),correct=FALSE)

#  Now same test using glm.scoretest

a <- gl(2,1,4)
b <- gl(2,2,4)
fit <- glm(y~a+b,family=poisson)
x2 <- c(0,0,0,1)
z <- glm.scoretest(fit,x2)
z^2



