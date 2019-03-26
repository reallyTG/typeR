library(Rfast2)


### Name: MLE of the zero inflated logistic normal distribution
### Title: MLE of the zero inflated logistic normal distribution
### Aliases: zil.mle

### ** Examples

x <- rbeta(300, 4, 10)
x[sample(1:300, 30)] <- 0
zil.mle(x)



