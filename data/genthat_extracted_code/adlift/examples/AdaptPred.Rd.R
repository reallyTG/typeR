library(adlift)


### Name: AdaptPred
### Title: AdaptPred
### Aliases: AdaptPred
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
ap<-AdaptPred(order(tx),tx,ty,out$nbrs,173,FALSE,2)
#
#the detail coefficient:
ap[[3]]

#and let's check the scheme used:
ap[[4]]

ap[[5]]






