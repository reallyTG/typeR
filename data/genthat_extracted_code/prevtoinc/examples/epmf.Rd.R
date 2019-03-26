library(prevtoinc)


### Name: epmf
### Title: Calculate empirical probability mass function for a discrete
###   positive distribution starting at 1
### Aliases: epmf

### ** Examples


# generate random sample of independent draws from Poisson distribution
x <- rpois(200,4)
# calculate empirical probability mass function and true probability mass function
y.emp  <- epmf(x)
y.theo <- dpois(1:max(x), 4)
plot(y.emp)
points(y.theo, col = "red")




