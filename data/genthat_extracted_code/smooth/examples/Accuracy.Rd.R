library(smooth)


### Name: Accuracy
### Title: Accuracy of forecasts
### Aliases: Accuracy
### Keywords: models nonlinear regression smooth ts univar

### ** Examples



y <- rnorm(100,10,2)
esmodel <- es(y[1:90],model="ANN",h=10)

Accuracy(y[91:100],esmodel$forecast,y[1:90],digits=5)




