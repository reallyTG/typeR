library(astrolibR)


### Name: calz_unred
### Title: Deredden a galaxy spectrum using the Calzetti et al. (2000)
###   recipe
### Aliases: calz_unred
### Keywords: misc

### ** Examples

w <- 1200 + seq(50, 2000, by=50)  # wavelength vector
f <- rep(1, length(w))   # flat initial spectrum
calz_unred(w, f, ebv=0.1)



