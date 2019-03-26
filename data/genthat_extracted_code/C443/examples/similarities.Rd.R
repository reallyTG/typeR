library(C443)


### Name: similarities
### Title: Calculating similarities between classification trees
### Aliases: similarities

### ** Examples

require(MASS)
#Grow a forest of classification trees based on 10 bootstrap samples
forest <- growforest(Pima.tr, X=c("npreg", "glu", "bp", "skin", "bmi", "ped", "age"), 
Y ="type", ntrees = 10)

# Calculate similiarties between all pairs of trees in the forest
simmatrix <- similarities(fulldata = Pima.tr, treedata = forest[[2]], Y = rep("type", 10), 
X = c("npreg", "glu", "bp", "skin", "bmi", "ped", "age"), trees = forest[[1]], m = 1, weight = 0)

simmatrix2 <- similarities(fulldata = Pima.tr, treedata = forest[[2]], Y = rep("type",10), 
X = c("npreg", "glu", "bp", "skin", "bmi", "ped", "age"), trees = forest[[1]], m = 1, 
weight = 1, tol = c(3, 30, 10, 10, 5, 0.3, 10))



