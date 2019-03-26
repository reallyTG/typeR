library(DensParcorr)


### Name: DensParcorr
### Title: Conduct the Dens-Based approach for partial correlation
###   estimation
### Aliases: DensParcorr

### ** Examples


# require(gplots)
# require(clime)

## Simulated the data to use. 
# data = matrix(rnorm(200),ncol=20)

##### Example 1: Estimate the partial correlation matrices for the 
##### default series of tuning parameters. 
# t0 = proc.time()[3]
# dens.est = DensParcorr(data,select=FALSE)
# proc.time()[3]-t0

##### Example 2: Estimate the network that reaches 40% density level. 
# partial.dens.est = DensParcorr(data,dens.level  =.4,select=TRUE)

###### Example 3: Now, estimate the 60% density level network based 
###### on the same data. To speed up computation, we read in the 
###### previous output from Example 2 into Parcorr.est
# t0 = proc.time()[3]
# partial.dens.est2 = DensParcorr(data, Parcorr.est = partial.dens.est,
#                                 dens.level=.6,select=TRUE)
# proc.time()[3]-t0




