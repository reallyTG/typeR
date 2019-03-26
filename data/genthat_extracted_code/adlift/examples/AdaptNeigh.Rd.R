library(adlift)


### Name: AdaptNeigh
### Title: AdaptNeigh
### Aliases: AdaptNeigh
### Keywords: regression

### ** Examples

#
# Generate some doppler data: 500 observations.
#
tx <- runif(500)
ty<-make.signal2("doppler",x=tx)
#
# Compute the neighbours of point 173 (2 neighbours on each side)
#
out<-getnbrs(tx,173,order(tx),2,FALSE)

#
# Perform the adaptive lifting step 
#
an<-AdaptNeigh(order(tx),tx,ty,out$nbrs,173,FALSE,2)
#
an[[1]][[7]]

an[[2]][[3]]

#shows best prediction when removing point 173, with the neighbours used




