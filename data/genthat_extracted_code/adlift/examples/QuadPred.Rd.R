library(adlift)


### Name: QuadPred
### Title: QuadPred
### Aliases: QuadPred
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
# Perform quadratic prediction based on the neighbours (without intercept) 
#
qp<-QuadPred(order(tx),tx,ty,out$nbrs,173,FALSE,2)
#
#
qp[3:5]
#
#the regression curve details



