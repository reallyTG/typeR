library(fda)


### Name: sd.fd
### Title: Standard Deviation of Functional Data
### Aliases: sd.fd std.fd stdev.fd stddev.fd
### Keywords: smooth

### ** Examples

liptime  <- seq(0,1,.02)
liprange <- c(0,1)

#  -------------  create the fd object -----------------
#       use 31 order 6 splines so we can look at acceleration

nbasis <- 51
norder <- 6
lipbasis <- create.bspline.basis(liprange, nbasis, norder)
lipbasis <- create.bspline.basis(liprange, nbasis, norder)

#  ------------  apply some light smoothing to this object  -------

Lfdobj   <- int2Lfd(4)
lambda   <- 1e-12
lipfdPar <- fdPar(lipbasis, Lfdobj, lambda)

lipfd <- smooth.basis(liptime, lip, lipfdPar)$fd
names(lipfd$fdnames) = c("Normalized time", "Replications", "mm")

lipstdfd <- sd.fd(lipfd)
plot(lipstdfd)

all.equal(lipstdfd, std.fd(lipfd))
all.equal(lipstdfd, stdev.fd(lipfd))
all.equal(lipstdfd, stddev.fd(lipfd))




