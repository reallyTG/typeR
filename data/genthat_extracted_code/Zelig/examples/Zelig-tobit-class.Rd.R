library(Zelig)


### Name: Zelig-tobit-class
### Title: Linear Regression for a Left-Censored Dependent Variable
### Aliases: Zelig-tobit-class ztobit

### ** Examples

library(Zelig)
data(tobin)
z.out <- zelig(durable ~ age + quant, model = "tobit", data = tobin)
summary(z.out)




