library(smooth)


### Name: auto.gum
### Title: Automatic GUM
### Aliases: auto.gum
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


x <- rnorm(50,100,3)

# The best GUM model for the data
ourModel <- auto.gum(x,orderMax=2,lagMax=4,h=18,holdout=TRUE,intervals="np")

summary(ourModel)
forecast(ourModel)
plot(forecast(ourModel))





