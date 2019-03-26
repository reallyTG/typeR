library(tframe)


### Name: checktframeConsistent
### Title: Check for a Consistent tframe
### Aliases: checktframeConsistent checktframeConsistent.default
### Keywords: programming utilities ts chron

### ** Examples

    z <- ts(rnorm(100), start=c(1982,1), frequency=12)
    checktframeConsistent(tframe(z), rnorm(100))



