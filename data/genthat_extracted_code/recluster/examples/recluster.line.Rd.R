library(recluster)


### Name: recluster.line
### Title: Identifies a line in a configuration and computes its intercept
###   and angular coefficient
### Aliases: recluster.line
### Keywords: configurations

### ** Examples

data(dataisl)
#Compute bidimensional representation for islands
pcoa<-cmdscale(recluster.dist(dataisl))
#Compute the line
lin<-recluster.line(pcoa)



