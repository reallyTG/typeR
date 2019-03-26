library(smam)


### Name: fitMRH
### Title: Fit a Moving-Resting-Handling Model with Embedded Brownian
###   Motion
### Aliases: fitMRH

### ** Examples

## No test: 
## slow work, may take several hours
set.seed(06269)
tgrid <- seq(0, 400, by = 8)
dat <- rMRH(tgrid, 4, 0.5, 0.1, 5, 0.8, 'm')
fitMRH(dat, c(4, 0.5, 0.1, 5, 0.8)) ## parallel process
fitMRH(dat, c(4, 0.5, 0.1, 5, 0.8), numThreads = -1) ## serial process

## fit part of dataset to the MRH model
batch <- c(rep(0, 10), rep(1, 7), rep(0, 10), rep(2, 10), rep(0, 14))
dat.segment <- cbind(dat, batch)
fit.segment <- fitMRH(dat.segment, start = c(4, 0.5, 0.1, 5, 0.8), segment = "batch")
head(dat.segment)
fit.segment
## End(No test)




