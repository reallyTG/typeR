library(lmodel2)


### Name: lmodel2
### Title: Model II regression
### Aliases: lmodel2 plot.lmodel2 lines.lmodel2 print.lmodel2
###   permutest.lmodel2 MA.reg SMA.reg CLma CLsma
### Keywords: models regression

### ** Examples

## The example data files are described in more detail in the
## \dQuote{Model II User's guide, R edition} tutorial. 

## Example 1 (surgical unit data)
data(mod2ex1)
Ex1.res <- lmodel2(Predicted_by_model ~ Survival, data=mod2ex1, nperm=99)
Ex1.res
plot(Ex1.res) 

## Example 2 (eagle rays and Macomona)
data(mod2ex2)
Ex2.res <- lmodel2(Prey ~ Predators, data=mod2ex2, "relative", "relative", 99)
Ex2.res
op <- par(mfrow = c(1,2))
plot(Ex2.res, "SMA")
plot(Ex2.res, "RMA")
par(op)

## Example 3 (cabezon spawning)
op <- par(mfrow = c(1,2))
data(mod2ex3)
Ex3.res <- lmodel2(No_eggs ~ Mass, data=mod2ex3, "relative", "relative", 99)
Ex3.res
plot(Ex3.res, "SMA")
plot(Ex3.res, "RMA")
par(op)

## Example 4 (highly correlated random variables)
op <- par(mfrow=c(1,2))
data(mod2ex4)
Ex4.res <- lmodel2(y ~ x, data=mod2ex4, "interval", "interval", 99)
Ex4.res
plot(Ex4.res, "OLS")
plot(Ex4.res, "MA")
par(op)

# Example 5 (uncorrelated random variables)
data(mod2ex5)
Ex5.res <- lmodel2(random_y ~ random_x, data=mod2ex5, "interval", "interval", 99)
Ex5.res
op <- par(mfrow = c(2,2))
plot(Ex5.res, "OLS")
plot(Ex5.res, "MA")
plot(Ex5.res, "SMA")
plot(Ex5.res, "RMA")
par(op)

## Example 6 where cor(y,x) = 0 by construct (square grid of points)

y0 = rep(c(1,2,3,4,5),5)
x0 = c(rep(1,5),rep(2,5),rep(3,5),rep(4,5),rep(5,5))
plot(x0, y0)
Ex6 = as.data.frame(cbind(x0,y0))
zero.res = lmodel2(y0 ~ x0, data=Ex6, "relative", "relative")
print(zero.res)
op <- par(mfrow = c(1,2))
plot(zero.res, "OLS")
plot(zero.res, "MA")
par(op)



