library(HistData)


### Name: DrinksWages
### Title: Elderton and Pearson's (1910) data on drinking and wages
### Aliases: DrinksWages
### Keywords: datasets

### ** Examples

data(DrinksWages)
plot(DrinksWages) 

# plot proportion sober vs. wage | class
with(DrinksWages, plot(wage, sober/n, col=c("blue","red","green")[class]))

# fit logistic regression model of sober on wage
mod.sober <- glm(cbind(sober, n) ~ wage, family=binomial, data=DrinksWages)
summary(mod.sober)
op <- par(mfrow=c(2,2))
plot(mod.sober)
par(op)

# TODO: plot fitted model



