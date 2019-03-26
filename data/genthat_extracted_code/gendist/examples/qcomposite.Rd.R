library(gendist)


### Name: qcomposite
### Title: Quantile function of composite model.
### Aliases: qcomposite

### ** Examples

x=runif(10, min=0, max=1)
y=qcomposite(x, spec1="lnorm", arg1=list(meanlog=0.1,sdlog=0.2), spec2="exp", 
             arg2=list(rate=0.5) )



