library(spcadjust)


### Name: SPCproperty
### Title: Computes bootstrap adjusted properties for control charts
### Aliases: SPCproperty

### ** Examples

 # calibrate CUSUM chart to an in-control ARL of 100.
 # run with a larger number of replications in real examples!
 X <-  rnorm(100) #observed data
 chart <- new("SPCCUSUM",model=SPCModelNormal(Delta=1)) # CUSUM chart with normal observations
SPCproperty(data=X,nrep=15,chart=chart,property="calARL", params=list(target=100))




