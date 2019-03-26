library(DendSer)


### Name: crit2cost
### Title: Cost function from seriation criterion
### Aliases: crit2cost

### ** Examples

	 			
require(DendSer) 			

d<- dist(iris[1:20,-5])
h <- hclust(d)
DendSer(h,d,cost=function(x,o,...) criterion(as.dist(x),o,method="AR_deviations"))
DendSer(h,d,cost=crit2cost("AR_deviations")) # short version of above
DendSer(h,d,cost=crit2cost("ME"))

# use DendSer methods via seriate
# get_order(seriate(d,method="Dendser", control=list(hclust=h,cost=costARc))) 
DendSer(h,d,cost=costARc)







