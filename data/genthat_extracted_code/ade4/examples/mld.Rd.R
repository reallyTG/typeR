library(ade4)


### Name: mld
### Title: Multi Level Decomposition of unidimensional data
### Aliases: mld haar2level
### Keywords: ts spatial

### ** Examples

## Not run: 
##D # decomposition of a time serie
##D data(co2)
##D x <- log(co2)
##D orthobas <- orthobasis.line(length(x))
##D level<-rep("D", 467)
##D level[1:3]<-rep("A", 3)
##D level[c(77,78,79,81)]<-rep("B", 4)
##D level[156]<-"C"
##D level<-as.factor(level)
##D res <- mld(x, orthobas, level)
##D sum(scale(x, scale = FALSE) - apply(res, 1, sum))
## End(Not run)
# decomposition of a biological trait on a phylogeny
data(palm)
vfruit<-palm$traits$vfruit
vfruit<-scalewt(vfruit)   
palm.phy<-newick2phylog(palm$tre)
level <- rep("F", 65)
level[c(4, 21, 3, 6, 13)] <- LETTERS[1:5]
level <- as.factor(level)
res <- mld(as.vector(vfruit), palm.phy$Bscores, level,
 phylog = palm.phy, clabel.nod = 0.7, f.phylog=0.8,
  csize = 2, clabel.row = 0.7, clabel.col = 0.7)



