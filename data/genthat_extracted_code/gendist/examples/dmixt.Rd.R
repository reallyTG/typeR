library(gendist)


### Name: dmixt
### Title: Probabilty density function of mixture model.
### Aliases: dmixt

### ** Examples

x=runif(10, min=0, max=1)
y=dmixt(x, phi=0.5, spec1="lnorm", arg1=list(meanlog=1,sdlog=2), spec2="exp", 
        arg2=list(rate=2) )



