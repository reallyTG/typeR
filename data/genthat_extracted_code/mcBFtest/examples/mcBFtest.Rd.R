library(mcBFtest)


### Name: mcBFtest
### Title: Monte Carlo based tests as an alternative of Welch's
###   t-approximation
### Aliases: mcBFtest
### Keywords: regression

### ** Examples


library(mcBFtest)

x <- sleep[1:10,1]
y <- sleep[11:20,1]

mcBFtest(x, y, method = "t")
mcBFtest(x, y, method = "W")
mcBFtest(x, y, method = "Monte Carlo", MC = 100000)




