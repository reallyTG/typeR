library(Hotelling)


### Name: print.hotelling.test
### Title: Prints the results from a Hotelling's T-squared test for the
###   difference in two multivariate sample means
### Aliases: print.hotelling.test
### Keywords: print

### ** Examples


data(bottle.df)
bottle.df = subset(bottle.df, Number == 1)
bottle.df$Number = rep(1:2,c(10,10))
fit = hotelling.test(.~Number, bottle.df, perm = TRUE)
fit
fit = hotelling.test(.~Number, bottle.df)
fit

## an explict call
print(fit)




