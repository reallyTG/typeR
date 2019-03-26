library(sound)


### Name: nullSample
### Title: The NULL Sample Object
### Aliases: nullSample
### Keywords: sysdata

### ** Examples
## Not run: 
##D scale <- 2^(seq(0,1,length=13))[c(1,3,5,6,8,10,12,13)]
##D base <- 440
##D s <- nullSample()
##D for (f in scale)
##D   s <- appendSample(s,Sine(f*base,1))
##D play(s)
## End(Not run)


