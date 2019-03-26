library(phylobase)


### Name: phylo4d-methods
### Title: Combine a phylogenetic tree with data
### Aliases: phylo4d-methods phylo4d phylo4d,phylo4-method
###   phylo4d,phylo4,phylo4-method phylo4d,matrix-method
###   phylo4d,matrix,matrix-method phylo4d,phylo-method
###   phylo4d,phylo,phylo-method phylo4d,phylo4d-method
###   phylo4d,phylo4d,phylo4d-method phylo4d,nexml-method
###   nexml,phylo4d-method
### Keywords: misc

### ** Examples


treeOwls <- "((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3);"
tree.owls.bis <- ape::read.tree(text=treeOwls)
try(phylo4d(as(tree.owls.bis,"phylo4"),data.frame(wing=1:3)), silent=TRUE)
obj <- phylo4d(as(tree.owls.bis,"phylo4"),data.frame(wing=1:3), match.data=FALSE)
obj
print(obj)

####

data(geospiza_raw)
geoTree <- geospiza_raw$tree
geoData <- geospiza_raw$data

## fix differences in tip names between the tree and the data
geoData <- rbind(geoData, array(, dim = c(1,ncol(geoData)),
                  dimnames = list("olivacea", colnames(geoData))))

### Example using a tree of class 'phylo'
exGeo1 <- phylo4d(geoTree, tip.data = geoData)

### Example using a tree of class 'phylo4'
geoTree <- as(geoTree, "phylo4")

## some random node data
rNodeData <- data.frame(randomTrait = rnorm(nNodes(geoTree)),
                        row.names = nodeId(geoTree, "internal"))

exGeo2 <- phylo4d(geoTree, tip.data = geoData, node.data = rNodeData)

### Example using 'merge.data'
data(geospiza)
trGeo <- extractTree(geospiza)
tDt <- data.frame(a=rnorm(nTips(trGeo)), row.names=nodeId(trGeo, "tip"))
nDt <- data.frame(a=rnorm(nNodes(trGeo)), row.names=nodeId(trGeo, "internal"))

(matchData1 <- phylo4d(trGeo, tip.data=tDt, node.data=nDt, merge.data=FALSE))
(matchData2 <- phylo4d(trGeo, tip.data=tDt, node.data=nDt, merge.data=TRUE))

## Example with 'all.data'
nodeLabels(geoTree) <- as.character(nodeId(geoTree, "internal"))
rAllData <- data.frame(randomTrait = rnorm(nTips(geoTree) + nNodes(geoTree)),
row.names = labels(geoTree, 'all'))

exGeo5 <- phylo4d(geoTree, all.data = rAllData)

## Examples using 'rownamesAsLabels' and comparing with match.data=FALSE
tDt <- data.frame(x=letters[1:nTips(trGeo)],
                  row.names=sample(nodeId(trGeo, "tip")))
tipLabels(trGeo) <- as.character(sample(1:nTips(trGeo)))
(exGeo6 <- phylo4d(trGeo, tip.data=tDt, rownamesAsLabels=TRUE))
(exGeo7 <- phylo4d(trGeo, tip.data=tDt, rownamesAsLabels=FALSE))
(exGeo8 <- phylo4d(trGeo, tip.data=tDt, match.data=FALSE))

## generate a tree and some data
set.seed(1)
p3 <- ape::rcoal(5)
dat <- data.frame(a = rnorm(5), b = rnorm(5), row.names = p3$tip.label)
dat.defaultnames <- dat
row.names(dat.defaultnames) <- NULL
dat.superset <- rbind(dat, rnorm(2))
dat.subset <- dat[-1, ]

## create a phylo4 object from a phylo object
p4 <- as(p3, "phylo4")

## create phylo4d objects with tip data
p4d <- phylo4d(p4, dat)
###checkData(p4d)
p4d.sorted <- phylo4d(p4, dat[5:1, ])
try(p4d.nonames <- phylo4d(p4, dat.defaultnames))
p4d.nonames <- phylo4d(p4, dat.defaultnames, match.data=FALSE)

## Not run: 
##D p4d.subset <- phylo4d(p4, dat.subset)
##D p4d.subset <- phylo4d(p4, dat.subset)
##D try(p4d.superset <- phylo4d(p4, dat.superset))
##D p4d.superset <- phylo4d(p4, dat.superset)
## End(Not run)

## create phylo4d objects with node data
nod.dat <- data.frame(a = rnorm(4), b = rnorm(4))
p4d.nod <- phylo4d(p4, node.data = nod.dat, match.data=FALSE)


## create phylo4 objects with node and tip data
p4d.all1 <- phylo4d(p4, node.data = nod.dat, tip.data = dat, match.data=FALSE)
nodeLabels(p4) <- as.character(nodeId(p4, "internal"))
p4d.all2 <- phylo4d(p4, all.data = rbind(dat, nod.dat), match.data=FALSE)



