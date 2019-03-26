library(gvlma)


### Name: gvlma-package
### Title: Global Validation of Linear Model Assumptions
### Aliases: gvlma-package
### Keywords: htest

### ** Examples

x1 <- rnorm(100,0,2)
x2 <- runif(100)
y <- 3*x1 -x2 + rnorm(100)
gvmodel <- gvlma(lm(y ~ x1 + x2))
plot(gvmodel)
summary(gvmodel)
gvmodel.del <- deletion.gvlma(gvmodel)
summary(gvmodel.del)
plot(gvmodel.del)



