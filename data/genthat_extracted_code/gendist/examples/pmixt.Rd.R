library(gendist)


### Name: pmixt
### Title: Cumulative distribution function of mixture model.
### Aliases: pmixt

### ** Examples

x=runif(10, min=0, max=1)
y=pmixt(x, phi=0.5, spec1="lnorm", arg1=list(meanlog=1,sdlog=2), spec2="exp", 
        arg2=list(rate=2) )



