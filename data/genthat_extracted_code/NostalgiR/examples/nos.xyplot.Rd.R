library(NostalgiR)


### Name: nos.xyplot
### Title: nos.xyplot text-based scatter plot.
### Aliases: nos.xyplot

### ** Examples

## Plot 10 correlated points
x <- 10*runif(10)
y <- x + rnorm(10)
nos.xyplot(x,y,type='p',xlab='x',ylab='y')

## Plot 10 correlated points with a regression line
x <- 10*runif(10)
y <- x + rnorm(10)
nos.xyplot(x,y,type='pr',xlab='x',ylab='y')

## Plot 10 correlated points with a linear interpolation
x <- 10*runif(10)
y <- x + rnorm(10)
nos.xyplot(x,y,type='lp',xlab='x',ylab='y')



