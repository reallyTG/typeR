library(mixtools)


### Name: spregmix
### Title: EM-like Algorithm for Semiparametric Mixtures of Regressions
### Aliases: spregmix
### Keywords: file

### ** Examples

data(tonedata)
## By default, the bandwidth will adapt and the error density is assumed symmetric
set.seed(100)
a=spregmix(tuned~stretchratio, bw=.2, data=tonedata, verb=TRUE)

## Look at the sp mixreg solution:
plot(tonedata)
abline(a=a$beta[1,1],b=a$beta[2,1], col=2)
abline(a=a$beta[1,2],b=a$beta[2,2], col=3)

## Look at the nonparametric KD-based estimate of the error density, 
## constrained to be zero-symmetric:
plot(xx<-a$density.x, yy<-a$density.y, type="l")
## Compare to a normal density with mean 0 and NP-estimated stdev:
z <- seq(min(xx), max(xx), len=200)
lines(z, dnorm(z, sd=sqrt((a$np.stdev)^2+a$bandwidth^2)), col=2, lty=2)
# Add bandwidth^2 to variance estimate to get estimated var of KDE

## Now add the sp mixreg estimate without assuming symmetric errors:
b=spregmix(tuned~stretchratio, bw=.2, , symm=FALSE, data=tonedata, verb=TRUE)
lines(b$density.x, b$density.y, col=3)



