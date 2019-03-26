library(DCL)


### Name: clm
### Title: Classical Chain Ladder Method
### Aliases: clm
### Keywords: models

### ** Examples

data(NtriangleDCL)
clm.N<-clm(NtriangleDCL)
# The alpha's
clm.N$alpha
# The beta's
clm.N$beta
# The development factors
clm.N$Fj
# Plotting the parameters and the dev. factors
Plot.clm.par(clm.N)
# The predictions
Nhat<-clm.N$triangle.hat
Plot.triangle(Nhat,Histogram=TRUE)

## Trying variations from classical chain ladder
# Try CLM only using the more recent 2 calendars in the development
# factors calculation
clm(NtriangleDCL,n.cal=2)

# Try CLM providing a vector with given development factors
my.Fj<-c(1.4,1.1,1.0,1.1,1.1,1.0,1.0,1.0,1.1)
clm(NtriangleDCL,Fj=my.Fj)




