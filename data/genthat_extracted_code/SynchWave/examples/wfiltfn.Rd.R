library(SynchWave)


### Name: wfiltfn
### Title: Wavelet Transform Function of the Wavelet Filter
### Aliases: wfiltfn
### Keywords: nonparametric

### ** Examples

psihfn <- wfiltfn("bump", list(mu=1, s=.5))
plot(psihfn(seq(-5, 5, by=0.01)), type="l", xlab="", ylab="")



