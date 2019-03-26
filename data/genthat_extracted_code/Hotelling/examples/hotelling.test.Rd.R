library(Hotelling)


### Name: hotelling.test
### Title: Two-sample Hotelling's T-squared test
### Aliases: hotelling.test hotelling.test.default hotelling.test.formula
###   hotel.test
### Keywords: htest

### ** Examples


data(container.df)
fit = hotelling.test(.~gp, data = container.df)
fit

subs.df = container.df[1:10,]
subs.df$gp = rep(1:2, c(5,5))
fitPerm = hotelling.test(Al+Fe~gp, data  = subs.df, perm =  TRUE)
fitPerm
plot(fitPerm)

data(bottle.df)
fit12 = hotelling.test(.~Number, data = bottle.df)
fit12

fit23 = hotelling.test(.~Number, data = bottle.df, pair = c(2,3))
fit23




