library(adlift)


### Name: LinearPred
### Title: LinearPred
### Aliases: LinearPred
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
# Perform linear regression based on the neighbours (without intercept) 
#
lp<-LinearPred(order(tx),tx,ty,out$nbrs,173,FALSE,2)
#
#
lp
#
#the regression curve details




