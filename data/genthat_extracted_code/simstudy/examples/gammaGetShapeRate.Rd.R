library(simstudy)


### Name: gammaGetShapeRate
### Title: Convert gamma mean and dispersion parameters to shape and rate
###   parameters
### Aliases: gammaGetShapeRate

### ** Examples

set.seed(12345)
mean = 5; dispersion = 1.5
rs <- gammaGetShapeRate(mean, dispersion)
c(rs$shape, rs$rate)
vec <- rgamma(1000, shape = rs$shape, rate = rs$rate)
(estMoments <- c(mean(vec), var(vec)))
(theoryMoments <- c(mean, mean^2*dispersion))
(theoryMoments <- c(rs$shape/rs$rate, rs$shape/rs$rate^2))



