library(adlift)


### Name: PointsUpdate
### Title: PointsUpdate
### Aliases: PointsUpdate PointsUpdate2
### Keywords: arith

### ** Examples

#
# Generate some blocks data: 100 observations.
#
x <- runif(100)
y <-make.signal2("blocks",x=x)
#
#find initial interval lengths...
#
I<-intervals(x,"reflect")
lengths<-lengthintervals(x,I,neighbours=2,closest=FALSE)
#
#perform prediction step...
p<-AdaptNeigh(order(x),x,y,32,5,TRUE,2)
#
#
u<-PointsUpdate(x,p$results[[6]],p$newinfo[[2]],p$newinfo[[3]],5,order(x),p$results[[4]],lengths)
#
#and here are the updated coefficients...
u$coeff
# 





