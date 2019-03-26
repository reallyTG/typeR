library(adlift)


### Name: UndoPointsUpdate
### Title: UndoPointsUpdate
### Aliases: UndoPointsUpdate UndoPointsUpdate2
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
u<-PointsUpdate(x,p$results[[6]],p$newinfo[[2]],p$newinfo[[3]],5,order(x),p$results[[4]],
lengths)
#
p2<-setdiff(order(x),5)
a<-which(order(x)==5)
l2<-lengths[setdiff(1:100, a)]
#
#remove the lifted coefficient
#
#now undo the update step...
#
undo<-UndoPointsUpdate(x,u$coeff,p$newinfo[[2]],p$newinfo[[3]],5,a,99,p2,
p$results[[4]],l2,lengths[a])
#




