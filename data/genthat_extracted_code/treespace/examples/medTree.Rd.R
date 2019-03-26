library(treespace)


### Name: medTree
### Title: Geometric median tree function
### Aliases: medTree

### ** Examples


## EXAMPLE WITH WOODMICE DATA
data(woodmiceTrees)

## LOOKING FOR A SINGLE MEDIAN
## get median tree(s)
res <- medTree(woodmiceTrees)
res

## plot first tree
med.tree <- res$trees[[1]]
plot(med.tree)

## LOOKING FOR MEDIANS IN SEVERAL CLUSTERS
## identify 6 clusters
groves <- findGroves(woodmiceTrees, nf=3, nclust=6)

## find median trees
res.with.grp <- medTree(woodmiceTrees, groves$groups)

## there is one output per cluster
names(res.with.grp)

## get the first median of each
med.trees <- lapply(res.with.grp, function(e) ladderize(e$trees[[1]]))

## plot trees
par(mfrow=c(2,3))
for(i in 1:length(med.trees)) plot(med.trees[[i]], main=paste("cluster",i))

## highlight the differences between a pair of median trees
plotTreeDiff(med.trees[[1]],med.trees[[5]])




