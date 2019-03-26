library(smam)


### Name: fitBMME
### Title: Fit a Brownian Motion with Measurement Error
### Aliases: fitBMME fitBmme

### ** Examples

set.seed(123)
tgrid <- seq(0, 500, by = 1)
dat <- rBMME(tgrid, sigma = 1, delta = 0.5)

## using whole dataset to fit BMME
fit <- fitBMME(dat)
fit

## using part of dataset to fit BMME
batch <- c(rep(0, 100), rep(1, 200), rep(0, 50), rep(2, 100), rep(0, 51))
dat.segment <- cbind(dat, batch)
fit.segment <- fitBMME(dat.segment, segment = "batch")
head(dat.segment)
fit.segment




