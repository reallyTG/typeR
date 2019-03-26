library(breakage)


### Name: fit.sensitivity.plot
### Title: Visualise fit sensitivity for a breakage-resistance model
### Aliases: fit.sensitivity.plot

### ** Examples

# fake up some breakage data
brks <- sort(abs(0.5 + rnorm(n=15, sd=0.5) * 1:15))
res <- resist.breakage(brks, theta=3*pi/180, r=0.04, rho=64) + rnorm(15)
dat <- list(x=brks, y=res)

# fit it
fit <- fit.breakage(dat, do.plot=FALSE)

# plot the sensitivity surface
fit.sensitivity.plot(dat, fit)



