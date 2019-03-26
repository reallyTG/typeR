library(PredictionR)


### Name: bestfit
### Title: Best fitting of a distribution to a data
### Aliases: bestfit

### ** Examples


#best fitting of a logistic distribution
#
n=100
x1 <- rlogis(n, 0.5, 0.8)
bestfit(x1, "logis")
bestfit(x1, "logis")$p.value




