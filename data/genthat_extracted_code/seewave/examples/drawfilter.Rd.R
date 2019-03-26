library(seewave)


### Name: drawfilter
### Title: Draw the amplitude profile of a frequency filter
### Aliases: drawfilter
### Keywords: ts filter

### ** Examples

## Not run: 
##D f <- 8000
##D a <- noisew(f=f, d=1)
##D ## bandpass continuous and discrete
##D cont.disc <- drawfilter(f=f/2)
##D a.cont.disc <- fir(a, f=f, custom=cont.disc)
##D spectro(a.cont.disc, f=f)
##D ## bandpass continuous only
##D cont <- drawfilter(f=f/2, discrete=FALSE)
##D a.cont <- fir(a, f=f, custom=cont)
##D spectro(a.cont, f=f)
##D ## bandstop continuous only
##D cont.stop <- drawfilter(f=f/2, discrete=FALSE)
##D a.cont.stop <- fir(a, f=f, custom=cont.stop, bandpass=FALSE)
##D spectro(a.cont.stop, f=f)
##D ## bandpass discrete only
##D disc <- drawfilter(f=f/2, continuous=FALSE)
##D a.disc <- fir(a, f=f, custom=disc, bandpass=FALSE)
##D spectro(a.disc, f=f)
## End(Not run)



