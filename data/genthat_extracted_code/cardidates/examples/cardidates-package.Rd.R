library(cardidates)


### Name: cardidates-package
### Title: Identification of Cardinal Dates in Ecological Time Series
### Aliases: cardidates-package cardidates
### Keywords: package

### ** Examples

########## quick start for the impatient ###############
## create some test data
set.seed(123)
x <- seq(0, 360, length = 20)
y <- abs(rnorm(20, mean = 1, sd = 0.1))
y[5:10] <- c(2, 4, 7, 3, 4, 2)

## fit Weibull function with 6 free parameters
res <- fitweibull6(x, y)
plot(res)
summary(res)

################## more details #########################

## show some properties
res$r2
p <- res$p
o <- res$fit
f <- res$ymax

## identify cardinal dates from fitted curves
(smd  <- CDW(p))
(smda <- CDW(p, symmetric = FALSE))

## plot data, curve and cardinal dates
plot(x, y, ylim = c(0, 10), xlim = c(0, 365))
lines(o$x, o$f * f)
points(x, fweibull6(x, p) * f, col = "green")
points(smd$x, smd$y * f, col = "orange", pch = 16)

## or, alternatively:
points(smda$x, fweibull6(smda$x, p) * f, col = "red", pch = 1, cex = 1.2)

## for comparison: fit of a 4 parameter Weibull
res4  <- fitweibull4(x, y)
res4$r2
p <- res4$p
o <- res4$fit
f <- res4$ymax
smd  <- CDW(p)
lines(o$x, o$f * f, col = "blue")
points(smd$x, fweibull4(smd$x, p) * f, col = "blue", pch = 16)




