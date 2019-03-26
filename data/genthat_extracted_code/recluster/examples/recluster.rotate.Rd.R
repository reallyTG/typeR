library(recluster)


### Name: recluster.rotate
### Title: Rotates a bidimensional configuration according to a line
### Aliases: recluster.rotate
### Keywords: configurations

### ** Examples

data(dataisl)
#Compute bidimensional representation for islands
pcoa<-cmdscale(recluster.dist(dataisl))
plot (pcoa)
#Compute the line
lin<-recluster.line(pcoa)
transf<-recluster.rotate(pcoa,m=lin$m,q=lin$q)
plot(transf)



