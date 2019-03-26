library(breakage)


### Name: fit.breakage
### Title: Fit a tip geometry model to breakage resistance data
### Aliases: fit.breakage

### ** Examples

# fake up some breakage data
brks <- sort(abs(0.5 + rnorm(n=15, sd=0.5) * 1:15))
res <- resist.breakage(brks, theta=3*pi/180, r=0.04, rho=64) + rnorm(15)

# fit it
fit.breakage(list(x=brks, y=res))



