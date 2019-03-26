library(C443)


### Name: clusterforest
### Title: Clustering the classification trees in a forest
### Aliases: clusterforest

### ** Examples

require(MASS)

#Create a forest by drawing 10 bootstrap samples and growing a classification tree on each one
forest <- growforest(data = Pima.tr, X = c("npreg", "glu",  "bp",  "skin",  "bmi", "ped", "age"), 
Y = "type", ntrees = 10)

#Calculate similarities between all pairs of trees in the forest 
simmatrix <- similarities(fulldata = Pima.tr, treedata = forest[[2]], Y = rep("type", 10),
X = c("npreg", "glu", "bp", "skin", "bmi", "ped", "age"), trees=forest[[1]], m = 1, weight = 0)

#Cluster the trees in the forest.
cforest<- clusterforest(simmatrix = simmatrix, trees = forest[[1]], 
fulldata= Pima.tr, treedata=forest[[2]], Y=rep("type", 10), fromclus=1, toclus=5)

#Inspect medoids of five cluster solution
cforest$mds[[5]]



