library(BAMBI)


### Name: zero_to_2pi
### Title: Wrap angles into '[-pi, pi]' or '[0, 2*pi]'
### Aliases: zero_to_2pi minuspi_to_pi

### ** Examples

dat <- matrix(runif(100, -pi, pi), ncol=2)
dat1 <- zero_to_2pi(dat)
dat2 <- minuspi_to_pi(dat1)
all.equal(dat, dat2)



