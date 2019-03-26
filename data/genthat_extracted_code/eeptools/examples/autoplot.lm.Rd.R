library(eeptools)


### Name: autoplot.lm
### Title: A function to replicate the basic plot function for linear
###   models in ggplot2
### Aliases: autoplot.lm

### ** Examples

# Univariate
a <- runif(1000)
b <- 7 * a + rnorm(1)
mymod <- lm(b~a)
autoplot(mymod)
# Multivariate
data(mpg)
mymod <- lm(cty~displ + cyl + drv, data=mpg)
autoplot(mymod)




