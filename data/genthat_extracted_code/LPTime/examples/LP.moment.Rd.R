library(LPTime)


### Name: LP.moment
### Title: Finds LP moments of a random variable or comoments of two random
###   variables
### Aliases: LP.moment LP.comoment
### Keywords: univar nonparametric

### ** Examples

xdata <- rnorm(100)
head(LP.moment(xdata, m =4))

require(stats)
data(faithful)
head(LP.comoment(faithful$eruptions,faithful$waiting,m=4))



