library(evt0)


### Name: mop.AREFF
### Title: Asymptotic efficiency of mean of order p
### Aliases: mop.AREFF
### Keywords: MOP AREFF

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1)

# estimate AREFF
mop.AREFF(x,c(1,500,5000,49999), c(-1,0,0.1))



