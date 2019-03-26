library(geofd)


### Name: trace.variog
### Title: Empirical Variograms for function-value data
### Aliases: trace.variog geofd.trace.variog
### Keywords: spatial

### ** Examples


# First example: creating a binned variogram
# okfd first example

data(maritimes.avg)
data(maritimes.coords)
data(maritimes.data)
coord.cero <- matrix(c(-64.06, 45.79),nrow=1,ncol=2)
n<-dim(maritimes.data)[1]
argvals<-seq(1,n, by=1)
okfd.res<-okfd(new.coords=coord.cero, coords=maritimes.coords,
              data=maritimes.data, nbasis=65, argvals=argvals, fix.nugget=TRUE,
              kappa=0.7)

# Calculating the empiricial trace bin variogram
new.emp.trace.vari <- trace.variog(coords=okfd.res$coords,
                      L2norm=okfd.res$emp.trace.vari$L2norm, bin=TRUE)

# The empirical trace cloud variogram is replaced with the trace bin variogram
okfd.res$emp.trace.vari <- new.emp.trace.vari

# The modified okfd result is plotted
plot(okfd.res)




