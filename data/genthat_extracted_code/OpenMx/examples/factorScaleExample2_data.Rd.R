library(OpenMx)


### Name: factorScaleExample2
### Title: Example Factor Analysis Data for Scaling the Model
### Aliases: factorScaleExample2
### Keywords: datasets

### ** Examples

data(factorScaleExample2)
round(cor(factorScaleExample2), 2)

data(factorScaleExample2)
plot(sapply(factorScaleExample1, var), type='l', ylim=c(0, 6), lwd=3)
lines(1:12, sapply(factorScaleExample2, var), col='blue', lwd=3)




