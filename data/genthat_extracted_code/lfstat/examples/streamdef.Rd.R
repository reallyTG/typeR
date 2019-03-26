library(lfstat)


### Name: streamdef
### Title: Streamflow Deficit
### Aliases: streamdef
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ngaruroro)
ng <- subset(ngaruroro, hyear > 1980)

#Full Table
streamdef(ng, pooling = "MA", MAdays = 6)

#Annual Volume-Maxima only
streamdef(ng, pooling = "MA", MAdays = 6,table = "volmax")



