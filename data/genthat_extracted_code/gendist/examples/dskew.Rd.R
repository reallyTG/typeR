library(gendist)


### Name: dskew
### Title: Probabilty density function of skewed symmetric model.
### Aliases: dskew

### ** Examples

x=runif(10, min=0, max=1)
y=dskew(x, spec1="norm", arg1=list(mean=0,sd=1), spec2="logis", 
        arg2=list(location=0,scale=2) )



