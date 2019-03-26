library(seewave)


### Name: combfilter
### Title: Comb filter
### Aliases: combfilter
### Keywords: ts filter

### ** Examples

## Not run: 
##D f <- 44100
##D ## chirp
##D s1 <- synth(f=f, cf=1, d=2, fm=c(0,0,f/2,0,0), out="Wave")
##D combfilter(s1, alpha=1, K=50, plot=TRUE)
##D ## harmonic sound
##D s2 <- synth(f=f, d=2, cf=600, harmonics=rep(1, 35), output="Wave")
##D combfilter(s2, alpha=1, K=10, plot=TRUE)
##D ## noise, units in seconds
##D s3 <- noisew(d=2, f=44100, out="Wave")
##D combfilter(s3, alpha=0.5, K=1e-4, units="seconds", plot=TRUE)
## End(Not run)



