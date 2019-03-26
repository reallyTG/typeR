library(tsna)


### Name: moodyContactSim
### Title: Jim Moody's example dynamic contact simulation network
### Aliases: moodyContactSim
### Keywords: datasets

### ** Examples

data(moodyContactSim)
# plot a view of network with edge and vertex labels
plot(moodyContactSim,
     displaylabels=TRUE,
     label.cex=0.8,
     label.pos=5,
     vertex.col='white',
     vertex.cex=2,
     edge.label=sapply(get.edge.activity(moodyContactSim),function(e){
       paste('(',e[,1],'-',e[,2],')',sep='')
     }),
     edge.label.col='blue',
     edge.label.cex=0.8
   )
## Not run: 
##D # data object was created with
##D moodyContactSim<-network.initialize(16,directed=FALSE)
##D tel<-matrix(c(674,701,1,9,
##D               214,247,1,11,
##D               621,651,1,12,
##D               583,615,1,16,
##D               749,793,11,8,
##D               719,745,8,13,
##D               712,739,13,5,
##D               634,660,13,3,
##D               769,795,13,7,
##D               453,479,13,4,
##D               494,524,13,2,
##D               224,256,7,10,
##D               40,72,10,4,
##D               665,692,4,14,
##D               709,740,2,15,
##D               575,599,2,16,
##D               748,782,4,16,
##D               701,733,16,6),
##D             ncol=4,byrow=TRUE)
##D moodyContactSim<-networkDynamic(moodyContactSim,edge.spells=tel)
##D obs<-moodyContactSim%n%'net.obs.period'
##D obs$mode<-'discrete'
##D obs$time.increment<-1
##D obs$time.unit<-'step'
##D obs$observations<-list(c(0,1000))
##D moodyContactSim%n%'net.obs.period'<-obs
## End(Not run)   



