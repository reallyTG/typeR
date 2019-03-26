library(adlift)


### Name: CubicPred
### Title: CubicPred
### Aliases: CubicPred
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
# Perform cubic prediction based on the neighbours (without intercept) 
#
cp<-CubicPred(order(tx),tx,ty,out$nbrs,173,FALSE,2)
#
cp$bhat

#
#the coefficients which define the cubic regression curve
#
cp$pred

#
#the predicted value from the regression curve
#



