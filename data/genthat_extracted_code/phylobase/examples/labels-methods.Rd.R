library(phylobase)


### Name: phylo4-labels
### Title: Labels for phylo4/phylo4d objects
### Aliases: phylo4-labels labels labels,phylo4-method labels<-
###   labels<-,phylo4-method hasDuplicatedLabels
###   hasDuplicatedLabels,phylo4-method
###   hasDuplicatedLabels,phylo4,ANY-method hasNodeLabels
###   hasNodeLabels,phylo4-method nodeLabels nodeLabels,phylo4-method
###   nodeLabels<- nodeLabels<-,phylo4-method tipLabels
###   tipLabels,phylo4-method tipLabels<- tipLabels<-,phylo4-method
###   hasEdgeLabels hasEdgeLabels,phylo4-method edgeLabels
###   edgeLabels,phylo4-method edgeLabels<- edgeLabels<-,phylo4-method

### ** Examples


data(geospiza)

## Return labels from geospiza
tipLabels(geospiza)

## Internal node labels in geospiza are empty
nodeLabels(geospiza)

## Creating internal node labels
ndLbl <- paste("n", 1:nNodes(geospiza), sep="")
nodeLabels(geospiza) <- ndLbl
nodeLabels(geospiza)

## naming the labels
names(ndLbl) <- nodeId(geospiza, "internal")

## shuffling the labels
(ndLbl <- sample(ndLbl))

## by default, the labels are attributed in the order
## they are given:
nodeLabels(geospiza) <- ndLbl
nodeLabels(geospiza)

## but use.names puts them in the correct order
labels(geospiza, "internal", use.names=TRUE) <- ndLbl
nodeLabels(geospiza)



