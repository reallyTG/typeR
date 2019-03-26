library(Sim.DiffProc)


### Name: moment
### Title: Monte-Carlo statistics of SDE's
### Aliases: bconfint kurtosis moment Median Mode cv skewness
###   bconfint.default kurtosis.default moment.default cv.default
###   Median.default Mode.default skewness.default

### ** Examples

## Example 1:
## dX(t) = 2*(3-X(t)) *dt + dW(t)
set.seed(1234)

f <- expression( 2*(3-x) )
g <- expression( 1 )
mod <- snssde1d(drift=f,diffusion=g,M=10000,T=5)
## Monte-Carlo statistics of 5000 trajectory of X(t) at final time T of 'mod'
summary(mod)
kurtosis(mod)
skewness(mod)
mean(mod)
Median(mod)
Mode(mod)
moment(mod,order=4)
cv(mod)
bconfint(mod,level = 0.95) ## of mean



