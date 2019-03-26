library(Zelig)


### Name: Zelig-quantile-class
### Title: Quantile Regression for Continuous Dependent Variables
### Aliases: Zelig-quantile-class zquantile

### ** Examples

library(Zelig)
data(stackloss)
z.out1 <- zelig(stack.loss ~ Air.Flow + Water.Temp + Acid.Conc.,
model = "rq", data = stackloss,tau = 0.5)
summary(z.out1)




