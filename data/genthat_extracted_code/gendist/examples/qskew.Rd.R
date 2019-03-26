library(gendist)


### Name: qskew
### Title: Quantile function of skewed symmetric model.
### Aliases: qskew

### ** Examples

x=runif(10, min=0, max=1)
y=qskew(x, spec1="norm", arg1=list(mean=0,sd=0.1), spec2="logis", 
        arg2=list(location=0,scale=0.2))



