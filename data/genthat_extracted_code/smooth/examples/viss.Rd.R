library(smooth)


### Name: viss
### Title: Vector Intermittent State Space
### Aliases: viss
### Keywords: demand exponential forecasting intermittent iss model models
###   nonlinear regression smooth smoothing space state ts univar

### ** Examples


    Y <- cbind(c(rpois(25,0.1),rpois(25,0.5),rpois(25,1),rpois(25,5)),
               c(rpois(25,0.1),rpois(25,0.5),rpois(25,1),rpois(25,5)))

    viss(Y, intermittent="l")
    viss(Y, intermittent="l", probability="i")




