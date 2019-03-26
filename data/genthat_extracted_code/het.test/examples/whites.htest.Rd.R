library(het.test)


### Name: whites.htest
### Title: White's Test for Heteroskedasticity
### Aliases: whites.htest

### ** Examples

library(vars) 
dataset <- data.frame(x=rnorm(100), y=rnorm(100)) 
model1 <- VAR(dataset, p = 1) 
whites.htest(model1) 



