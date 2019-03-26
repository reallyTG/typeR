library(SemiPar)


### Name: fuel.frame
### Title: Automobile data from consumer reports
### Aliases: fuel.frame
### Keywords: datasets

### ** Examples

library(SemiPar)
data(fuel.frame)
pairs(fuel.frame)
par(mfrow=c(2,2))
fuel.fit <- lm(Fuel ~ Weight + Disp.,fuel.frame)
plot(fuel.fit,ask=FALSE)
par(mfrow=c(1,1))



