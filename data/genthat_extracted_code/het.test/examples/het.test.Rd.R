library(het.test)


### Name: het.htest-package
### Title: Package for White's Test for Heteroskedasticity
### Aliases: het.htest-package
### Keywords: residuals, heteroskedasticity, VAR

### ** Examples

library(vars)
dataset <- data.frame(x=rnorm(100), y=rnorm(100))
model1 <- VAR(dataset, p = 1)
whites.htest(model1)



