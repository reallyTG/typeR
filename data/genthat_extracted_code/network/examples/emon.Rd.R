library(network)


### Name: emon
### Title: Interorganizational Search and Rescue Networks (Drabek et al.)
### Aliases: emon
### Keywords: datasets

### ** Examples

data(emon)   #Load the emon data set

#Plot the EMONs
par(mfrow=c(3,3))
for(i in 1:length(emon))
  plot(emon[[i]],main=names(emon)[i],edge.lwd="Frequency")



