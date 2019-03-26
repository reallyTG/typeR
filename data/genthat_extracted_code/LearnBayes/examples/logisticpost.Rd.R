library(LearnBayes)


### Name: logisticpost
### Title: Log posterior for a binary response model with a logistic link
###   and a uniform prior
### Aliases: logisticpost
### Keywords: models

### ** Examples

x = c(-0.86,-0.3,-0.05,0.73)
n = c(5,5,5,5)
y = c(0,1,3,5)
data = cbind(x, n, y)
beta=c(2,10)
logisticpost(beta,data)



