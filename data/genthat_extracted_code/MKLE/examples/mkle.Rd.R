library(MKLE)


### Name: mkle
### Title: Maximum kernel likelihood estimation
### Aliases: mkle
### Keywords: univar nonparametric

### ** Examples

data(state)
plot(density(state$CRIME))
abline(v=mean(state$CRIME),col='red')
abline(v=mkle(state$CRIME),col='blue')



