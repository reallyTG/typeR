library(oce)


### Name: [[<-,ctd-method
### Title: Replace Parts of a CTD Object
### Aliases: [[<-,ctd-method

### ** Examples

data(ctd)
summary(ctd)
# Move the CTD profile a nautical mile north.
ctd[["latitude"]] <- 1/60 + ctd[["latitude"]] # acts in metadata
# Increase the salinity by 0.01.
ctd[["salinity"]] <- 0.01 + ctd[["salinity"]] # acts in data
summary(ctd)




