library(NetComp)


### Name: netIntersect
### Title: Network Intersection
### Aliases: netIntersect

### ** Examples

 #using the state.x77 and USArrests datasets
 arrestCor<-cor(t(USArrests))
 stateCor<-cor(t(state.x77))
 isect<-netIntersect(stateCor, arrestCor)
 isect[1:15,1:5]
 #Setting a cutoff to remove any edges that are below 0.6 
 isect.6<-netIntersect(stateCor, arrestCor, cutoff=0.6)
 isect.6[1:15,1:5]



