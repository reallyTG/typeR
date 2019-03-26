library(spaMM)


### Name: how
### Title: Extract information about how an object was obtained
### Aliases: how how.default how.HLfit

### ** Examples

foo <- HLfit(y~x, data=data.frame(x=runif(3),y=runif(3)),HLmethod="ML",ranFix=list(phi=1))
how(foo)



