library(gendist)


### Name: dcomposite
### Title: Probabilty density function of composite model.
### Aliases: dcomposite

### ** Examples

x=runif(10, min=0, max=1)
y=dcomposite(x, spec1="lnorm", arg1=list(meanlog=0.1,sdlog=0.2), spec2="exp", 
             arg2=list(rate=0.5) )



