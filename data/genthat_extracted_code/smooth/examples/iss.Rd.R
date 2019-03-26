library(smooth)


### Name: iss
### Title: Intermittent State Space
### Aliases: iss
### Keywords: demand exponential forecasting intermittent iss model models
###   nonlinear regression smooth smoothing space state ts univar

### ** Examples


    y <- rpois(100,0.1)
    iss(y, intermittent="p")

    iss(y, intermittent="i", persistence=0.1)




