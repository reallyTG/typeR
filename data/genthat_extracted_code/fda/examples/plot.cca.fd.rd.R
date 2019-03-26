library(fda)


### Name: plot.cca.fd
### Title: Plot Functional Canonical Correlation Weight Functions
### Aliases: plot.cca.fd
### Keywords: smooth

### ** Examples


#  Canonical correlation analysis of knee-hip curves

gaittime  <- (1:20)/21
gaitrange <- c(0,1)
gaitbasis <- create.fourier.basis(gaitrange,21)
lambda    <- 10^(-11.5)
harmaccelLfd <- vec2Lfd(c(0, 0, (2*pi)^2, 0))
gaitfdPar <- fdPar(gaitbasis, harmaccelLfd, lambda)
gaitfd    <- smooth.basis(gaittime, gait, gaitfdPar)$fd
ccafdPar  <- fdPar(gaitfd, harmaccelLfd, 1e-8)
ccafd0    <- cca.fd(gaitfd[,1], gaitfd[,2], ncan=3, ccafdPar, ccafdPar)
#  display the canonical correlations
round(ccafd0$ccacorr[1:6],3)
#  plot the unrotated canonical weight functions
plot.cca.fd(ccafd0)
#  compute a VARIMAX rotation of the canonical variables
ccafd <- varmx.cca.fd(ccafd0)
#  plot the rotated canonical weight functions
plot.cca.fd(ccafd)




