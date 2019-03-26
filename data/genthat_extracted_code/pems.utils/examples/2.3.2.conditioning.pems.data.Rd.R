library(pems.utils)


### Name: 2.3.2.conditioning.pems.data
### Title: Data conditioning for pems data
### Aliases: 2.3.2.conditioning.pems.data conditioning.pems.data cutBy
###   cutByRow
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#basic usage

#working with a temporary pems

temp <- pems.1

#cut into equal subsets

temp$ref <- cutBy(velocity, n= 5, data=temp)

pemsPlot(local.time, velocity, cond=ref, data=temp, 
             type="l", layout=c(1,5))

#cut at three points

temp <- pems.1
temp$ref <- cutBy(velocity, rows=c(180,410,700), data=temp)

pemsPlot(local.time, velocity, cond=ref, data=temp, 
             type="l", layout=c(1,5))




