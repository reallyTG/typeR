library(astrolibR)


### Name: ccm_unred
### Title: Deredden a flux vector using the Cardelli et al. (1989)
###   parameterization
### Aliases: ccm_unred
### Keywords: misc

### ** Examples

w <- 1200 + seq(50, 2000, by=50)  # wavelength vector
f <- rep(1, length(w))   # flat initial spectrum
ccm_unred(w, f, ebv=0.1)



