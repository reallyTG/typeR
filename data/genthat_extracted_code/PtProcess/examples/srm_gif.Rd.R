library(PtProcess)


### Name: srm_gif
### Title: Conditional Intensity for Stress Release Model
### Aliases: srm_gif
### Keywords: models

### ** Examples

#  Treating North China as one region

data(NthChina)
p <- c(-2.46, 0.0113, 0.851)
times <- seq(0, 517, 0.5)

par.default <- par(mfrow=c(2,1), mar=c(4.1, 4.1, 0.5, 1))
plot(times+1480, srm_gif(NthChina, times, params=p), type="l",
     ylab=expression(lambda[g](t)),
     xlab="", xlim=c(1480, 2000))
plot(NthChina$time+1480, NthChina$magnitude+6, type="h",
     xlim=c(1480, 2000), ylim=c(5.8, 8.6),
     xlab="Year", ylab="Magnitude")

par(par.default)



