library(quantreg)


### Name: plot.rqss
### Title: Plot Method for rqss Objects
### Aliases: plot.rqss plot.qss1 plot.qss2 plot.summary.rqss
### Keywords: regression smooth iplot

### ** Examples

n <- 200
x <- sort(rchisq(n,4))
z <- x + rnorm(n)
y <- log(x)+ .1*(log(x))^2 + log(x)*rnorm(n)/4 + z
plot(x,y-z)
fN <- rqss(y~qss(x,constraint="N")+z)
plot(fN)
fI <- rqss(y~qss(x,constraint="I")+z)
plot(fI,  col="blue")
fCI <- rqss(y~qss(x,constraint="CI")+z)
plot(fCI, col="red")

## A bivariate example
data(CobarOre)
fCO <- rqss(z~qss(cbind(x,y),lambda=.08), data = CobarOre)
plot(fCO)



