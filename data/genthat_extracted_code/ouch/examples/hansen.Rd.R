library(ouch)


### Name: hansen
### Title: Hansen model of evolution along a phylogenetic tree
### Aliases: hansen
### Keywords: models

### ** Examples

## Not run: 
##D if (library(geiger)) {
##D 
##D ### an example data set (Darwin's finches)
##D data(geospiza)
##D str(geospiza)
##D sapply(geospiza,class)
##D 
##D ### check the correspondence between data and tree tips:
##D print(nc <- with(geospiza,name.check(geospiza.tree,geospiza.data)))
##D ### looks like one of the terminal twigs has no data associated
##D ### drop that tip:
##D tree <- with(geospiza,drop.tip(geospiza.tree,nc$tree_not_data))
##D dat <- as.data.frame(geospiza$dat)
##D 
##D 
##D ### make an ouchtree out of the phy-format tree
##D ot <- ape2ouch(tree)
##D 
##D ### merge data with tree info
##D otd <- as(ot,"data.frame")
##D ### in these data, it so happens that the rownames correspond to node names
##D ### we will exploit this correspondence in the 'merge' operation:
##D dat$labels <- rownames(dat)
##D otd <- merge(otd,dat,by="labels",all=TRUE)
##D rownames(otd) <- otd$nodes
##D print(otd)
##D ### this data-frame now contains the data as well as the tree geometry
##D 
##D ### now remake the ouch tree
##D ot <- with(otd,ouchtree(nodes=nodes,ancestors=ancestors,times=times,labels=labels))
##D 
##D b1 <- brown(tree=ot,data=otd[c("tarsusL","beakD")])
##D summary(b1)
##D 
##D ### evaluate an OU model with a single, global selective regime
##D otd$regimes <- as.factor("global")
##D h1 <- hansen(
##D              tree=ot,
##D              data=otd[c("tarsusL","beakD")],
##D              regimes=otd["regimes"],
##D              sqrt.alpha=c(1,0,1),
##D              sigma=c(1,0,1),
##D              maxit=10000
##D              )
##D summary(h1)
##D }
## End(Not run)



