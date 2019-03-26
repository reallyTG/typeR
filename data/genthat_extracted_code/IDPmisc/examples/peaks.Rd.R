library(IDPmisc)


### Name: peaks
### Title: Finding Peaks in Raw Data
### Aliases: peaks
### Keywords: manip dplot

### ** Examples

n <- 200
freq <- 1:n
theory <- sin(freq/n*4*pi)*cos(freq/n*3*pi)
spec <- theory + 0.1*rnorm(n)

plot(spec,type="b")
lines(theory,lwd=2)

pts <- peaks(spec, minPH=0.7)
points(pts,col="red",cex=1.2, pch=20)

## peaks after smoothing the spectrum
spec.sm <- loess.smooth(freq, spec, span=0.2,
                        degree = 2, evaluation = 100)
lines(spec.sm$x, spec.sm$y, col="steelblue", lwd=2)
pts <- peaks(spec.sm, minPH=0.4)
points(pts,col="green",cex=1.2,pch=20)

## Analyses of Mass Spectrum between 12000 and 100'000
## without smoothing, without baseline substraction
data(MS)
MS1 <- log10(MS[MS$mz>12000&MS$mz<1e5,])

P <- peaks(MS1, minPH=0.02, minPW=0.001)
plot(MS1, type="l", xlab="log10(mz)", ylab="log10(I)")
points(P,col="blue",cex=1.6)




