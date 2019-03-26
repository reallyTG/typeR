library(forestHES)


### Name: longtowide
### Title: A R function for converting to long data to wide data
### Aliases: longtowide

### ** Examples

#####Example######
##Following two example data with different subject, pineoakTree
##is for the base data of individual trees, and the herb data is for
##the base data of cluster.
data(treedata)
data(herbdata)

####Merge a species matrix from base data
##Note: following calculation only for the base data of individual not cluster
pineoak.spematrix<-longtowide(longdata=treedata,left="plot.id",up="spe.id")
pineoak.spematrix

##Equivalent method to merge species matrix from base data
treedata$abundance<-1
head(treedata)
tree.spematrix<-longtowide(longdata=treedata,left="plot.id",up="spe.id",inner="abundance")
tree.spematrix
herb.spematrix<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",inner="abundance")
herb.spematrix

####Compute the frequency of species in the multiple plots
##Merge a frequency matrix from base data
tree.freq<-longtowide(longdata=treedata,left="plot.id",up="spe.id",freq=TRUE)
tree.freq
herb.freq<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",freq=TRUE)
herb.freq

####Compute the attribute matrix from base data
##Single attribute matrix
tree.dbh<-longtowide(longdata=treedata,left="plot.id",up="spe.id",inner="dbh.cm")
tree.dbh
herb.cover<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",inner="coverage")
herb.cover

##Multiple attribute matrix
tree.multattr<-longtowide(longdata=treedata,left="plot.id",up="spe.id",
inner=c("dbh.cm","ht.m"))
tree.multattr
herb.multattr<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",
inner=c("coverage","abundance"))
herb.multattr

#######Calculation of Importance value (IV) for species######
####Calculation of Importance value (IV) for individual tree data
##Covert long data to wide data
tree.freq<-longtowide(longdata=treedata,left="plot.id",up="spe.id",freq=TRUE)$frequency
tree.density<-longtowide(longdata=treedata,left="plot.id",up="spe.id")/(20*400)
treedata$base<-pi*(treedata$dbh.cm)^2/10000
tree.dominance<-longtowide(longdata=treedata,left="plot.id",up="spe.id",inner="base")/(20*400)
##Compute the relative value
tree.refreq<-tree.freq/rowSums(tree.freq)*100
tree.redensity<-tree.density/rowSums(tree.density)*100
tree.redominance<-tree.dominance/rowSums(tree.dominance)*100
##Compute the importance value matrix
treeIVmatirx<-(tree.refreq+tree.redensity+tree.redominance)/3
##Compute the total importance value for species
treeTIV<-colSums(treeIVmatirx)/20
##Order the total importance value for species
sortedtreeTIV<-sort(treeTIV,decreasing=TRUE)
sortedtreeTIV

####Calculation of Importance value (IV) for clust herb data
##Covert long data to wide data
herb.freq<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",freq=TRUE)$frequency
herb.dencover<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",
inner=c("abundance","coverage"))
herb.density<-herb.dencover$abundance/100
herb.coverage<-herb.dencover$coverage/100
##Compute the relative value
herb.refreq<-herb.freq/rowSums(herb.freq)*100
herb.redensity<-herb.density/rowSums(herb.density)*100
herb.recoverage<-herb.coverage/rowSums(herb.coverage)*100
##Compute the importance value matrix
herbIVmatirx<-(herb.refreq+herb.redensity+herb.recoverage)/3
##Compute the total importance value for species
herbTIV<-colSums(herbIVmatirx)/20
##Order the total importance value for species
sortedherbTIV<-sort(herbTIV,decreasing=TRUE)
sortedtreeTIV



