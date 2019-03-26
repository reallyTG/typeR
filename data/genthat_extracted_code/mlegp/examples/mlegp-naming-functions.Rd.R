library(mlegp)


### Name: mlegp-naming-functions
### Title: mlegp naming functions
### Aliases: mlegp-naming-functions setParams setGPNames
### Keywords: internal

### ** Examples

## fit multiple Gaussian processes to multiple observations ##
x = -5:5
y1 = sin(x) + rnorm(length(x),sd=.1)
y2 = sin(x) + 2*x + rnorm(length(x), sd = .1)
fitMulti = mlegp(x, cbind(y1,y2))

## plot diagnostics with default gp names ##
plot(fitMulti)

## change names and plot again ##
fitMulti = setGPNames(fitMulti, c("y1", "y2"))
plot(fitMulti)

## plot diagnostic for the first Gaussian process, predicted vs. parameter ##
plot(fitMulti[[1]], type = 2)

## change parameter names (of all Gaussian processes) and plot again ##
fitMulti = setParams(fitMulti, "param 1")
plot(fitMulti[[1]], type = 2)



