library(smam)


### Name: rMR
### Title: Sampling from a Moving-Resting Process with Embedded Brownian
###   Motion
### Aliases: rMR rMovRes

### ** Examples

tgrid <- seq(0, 10, length=1001)
## make it irregularly spaced
tgrid <- sort(sample(tgrid, 800))
dat <- rMR(tgrid, 1, 1, 1, "m")
plot(dat[,1], dat[,2], xlab="t", ylab="X(t)", type='l')

dat2 <- rMR(tgrid, 1, 1, 1, "m", state = TRUE)
head(dat2)




