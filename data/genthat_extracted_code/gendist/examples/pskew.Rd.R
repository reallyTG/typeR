library(gendist)


### Name: pskew
### Title: Cumulative distribution function of skewed symmetric model.
### Aliases: pskew

### ** Examples

x=runif(10, min=0, max=1)
y=pskew(x, spec1="norm", arg1=list(mean=0,sd=1), spec2="logis", 
        arg2=list(location=0,scale=2) )



