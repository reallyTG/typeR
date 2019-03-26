library(trend)


### Name: ww.test
### Title: Wald-Wolfowitz Test for Independence and Stationarity
### Aliases: ww.test
### Keywords: htest nonparametric

### ** Examples

ww.test(nottem)
ww.test(Nile)

set.seed(200)
x <- rnorm(100)
ww.test(x)




