library(gplots)


### Name: bandplot
### Title: Plot x-y Points with Locally Smoothed Mean and Standard
###   Deviation
### Aliases: bandplot bandplot.formula bandplot.default
### Keywords: dplot

### ** Examples


# fixed mean, changing variance
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1 + x/1000 )
bandplot(x,y)
bandplot(y~x)

# fixed varance, changing mean
x <- 1:1000
y <- rnorm(1000, mean=x/1000, sd=1)
bandplot(x,y)

#
# changing mean and variance
#
x <- abs(rnorm(500))
y <- rnorm(500, mean=2*x, sd=2+2*x)

# the changing mean and dispersion are hard to see whith the points alone:
plot(x,y )

# regression picks up the mean trend, but not the change in variance
reg <- lm(y~x)
summary(reg)
abline(reg=reg, col="blue", lwd=2)

# using bandplot on the original data helps to show the mean and
# variance trend
bandplot(y ~ x)

# using bandplot on the residuals helps to see that regression removes
# the mean trend but leaves the trend in variability
bandplot(predict(reg),resid(reg))




