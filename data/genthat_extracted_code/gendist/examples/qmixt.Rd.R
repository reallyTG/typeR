library(gendist)


### Name: qmixt
### Title: Quantile function of mixture model.
### Aliases: qmixt

### ** Examples

x=runif(10, min=0, max=1)
y=qmixt(x, phi=0.5, spec1="lnorm", arg1=list(meanlog=0.1,sdlog=0.2), spec2="exp", 
        arg2=list(rate=0.5))



