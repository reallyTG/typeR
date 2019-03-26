library(uroot)


### Name: seasonal.dummies
### Title: Seasonal Dummies and Seasonal Cycles
### Aliases: seasonal.dummies seasonal.cycles
### Keywords: ts

### ** Examples

# In terms of model fitting
# both sets of variables are equivalent
x <- diff(log(AirPassengers))
sd <- seasonal.dummies(x)
fit1 <- lm(x ~ sd[,-1])
summary(fit1)
sc <- seasonal.cycles(x)
fit2 <- lm(x ~ sc)
summary(fit1)
all.equal(fitted(fit1), fitted(fit2))



