library(smam)


### Name: fitMR
### Title: Fit a Moving-Resting Model with Embedded Brownian Motion
### Aliases: fitMR fitMovRes

### ** Examples

## No test: 
tgrid <- seq(0, 10, length=500)
set.seed(123)
## make it irregularly spaced
tgrid <- sort(sample(tgrid, 30)) # change to 400 for a larger sample
dat <- rMR(tgrid, 1, 2, 25, "m")

## fit whole dataset to the MR model
fit.fl <- fitMR(dat, start=c(2, 2, 20), likelihood = "full")
fit.fl

fit.cl <- fitMR(dat, start=c(2, 2, 20), likelihood = "composite")
fit.cl

## fit part of dataset to the MR model
batch <- c(rep(0, 5), rep(1, 7), rep(0, 4), rep(2, 10), rep(0, 4))
dat.segment <- cbind(dat, batch)
fit.segment <- fitMR(dat.segment, start = c(2, 2, 20), segment = "batch",
                     likelihood = "full")
head(dat.segment)
fit.segment
## End(No test)




