library(C443)


### Name: treesource
### Title: The number of trees of each source that belong to each cluster
### Aliases: treesource

### ** Examples

#Grow forest based on multiple outcome variables, with 5 trees for each outcome variable
forest <- growforest(drugs, X = c("Age", "Gender", "Edu", "Neuro", "Extr", "Open", "Agree",
 "Consc", "Impul","Sensat"), Y = c("Amphet", "Benzos", "Coke", "Ecst"), ntrees = 5)

#Calculate similarities between the trees in the forest
simmatrix1 <- similarities(fulldata = drugs, treedata = forest[[2]], Y = rep(c("Amphet",
 "Benzos", "Coke", "Ecst"), each = 5), 
 X = c("Age", "Gender", "Edu", "Neuro", "Extr", "Open", "Agree", "Consc", "Impul","Sensat"),
 trees = forest[[1]], m = 1, weight = 0)

#Cluster the trees in the forest 
clusters <- clusterforest(simmatrix=simmatrix1, trees= forest[[1]], fulldata=drugs, 
treedata=forest[[2]], Y = rep(c("Amphet",
 "Benzos", "Coke", "Ecst"), each = 5), 
 fromclus=3, toclus=3)

#Visualize the number of trees for each source that belong to each cluster
treesource(source = rep(c("Amphet", "Benzos", "Coke", "Ecst"), each = 5),
clustering = clusters $ clusters[[3]])



