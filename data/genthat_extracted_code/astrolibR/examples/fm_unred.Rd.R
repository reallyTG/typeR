library(astrolibR)


### Name: fm_unred
### Title: Deredden a flux vector using the Fitzpatrick (1999)
###   parameterization
### Aliases: fm_unred
### Keywords: misc

### ** Examples

w <- 1200 + seq(50, 2000, by=50)  # wavelength vector
f <- rep(1, length(w))   # flat initial spectrum
fm_unred(w, f, ebv=0.1)



