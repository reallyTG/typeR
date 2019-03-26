library(mlegp)


### Name: is.gp
### Title: Gaussian Process and Gaussian Process Lists
### Aliases: is.gp is.gp.list
### Keywords: methods

### ** Examples

## fit a single Gaussian process ##
x = -5:5; y1 = sin(x) + rnorm(length(x),sd=.1)
fit1 = mlegp(x, y1)

is.gp(fit1)       ## returns TRUE
is.gp.list(fit1)  ## returns FALSE



