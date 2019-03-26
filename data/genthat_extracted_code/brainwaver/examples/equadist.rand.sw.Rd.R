library(brainwaver)


### Name: equadist.rand.sw
### Title: Small-world parameters for a simulated graph given its degree
###   distribution
### Aliases: equadist.rand.sw
### Keywords: graphs

### ** Examples


#For a scale-free graph

x<-1:50
probx<-x^(-1.4)
n.nodes<-50
n.edges<-250

stop<-0

while(stop==0){
write.table(stop)
r<-sample(x,n.nodes,prob=probx,replace=TRUE)
if(sum(r)==n.edges) stop<-1
  }

sf.degree<-r

mat<-sim.equadist(sf.degree)

result<-equadist.rand.sw(10, dat = "reduced", dist.mat=matrix(1,50,50), 
	                  degree.dist=sf.degree)




