library(Hotelling)


### Name: plot.hotelling.test
### Title: Plots the results from a permutation based version of
###   Hotelling's T-squared test for the difference in two multivariate
###   sample means
### Aliases: plot.hotelling.test
### Keywords: plot

### ** Examples


data(bottle.df)
bottle.df = subset(bottle.df, Number == 1)
bottle.df$Number = rep(1:2,c(10,10))
fit = hotelling.test(.~Number, bottle.df, perm = TRUE)
plot(fit)
plot(fit, col = "lightblue")




