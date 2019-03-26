library(smam)


### Name: rMRH
### Title: Sampling from a Moving-Resting-Handling Process with Embedded
###   Brownian Motion
### Aliases: rMRH

### ** Examples

set.seed(06269)
tgrid <- seq(0, 8000, length.out=1001)
dat <- rMRH(time=tgrid, lamM=4, lamR=0.04, lamH=0.2,
            sigma=1000, p=0.5, s0="m", dim=2)
plot(dat$time, dat$X1, type='l')
plot(dat$time, dat$X2, type='l')
plot(dat$X1,   dat$X2, type='l')

set.seed(06269) ## show the usage of state
dat2 <- rMRH(time=tgrid, lamM=4, lamR=0.04, lamH=0.2,
             sigma=1000, p=0.5, s0="m", dim=2, state=TRUE)
head(dat)
head(dat2)




