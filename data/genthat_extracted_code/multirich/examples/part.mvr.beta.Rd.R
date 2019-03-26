library(multirich)


### Name: part.mvr.beta
### Title: Partition multivariate richness Beta Component
### Aliases: part.mvr.beta

### ** Examples

## Partition beta diversity for two species in the iris dataset

# Set up record x trait matrix
ind.mat = iris
ind.mat$Species = NULL
ind.lbl = sprintf("Ind_%s",seq(1,nrow(iris)))
ind.mat = as.matrix(ind.mat) #Needs to be in matrix format
rownames(ind.mat) = ind.lbl

# Set up community matrix
com.base = iris$Species
pool = rep(1,nrow(iris))
com1 = sapply(com.base, function(x){ifelse(x == "setosa",1,0)})
com2 = sapply(com.base, function(x){ifelse(x == "versicolor",1,0)})
com3 = sapply(com.base, function(x){ifelse(x == "virginica",1,0)})
com.vec = c(pool,com1,com2,com3)
com.lbl = c("pool","com1","com2","com3") 
com.mat = matrix(com.vec, nrow = 4,byrow = TRUE,dimnames = list(com.lbl,ind.lbl))

# Specify the communities to compare
index.rows = c(2,4) #compare species 1 & 3 (+1 due to the pool being the first community)

# Do the diversity partitioning
part.out = part.mvr.beta(ind.mat,com.mat,index.rows,index.type = "Sorensen")
  com.overlap = part.out[[1]]
  #0: no overlap
  com.dis = part.out[[2]]
  #1: complete dissimilarity
  com.turn = part.out[[3]]
  #1: This gives the absolute amount of dissimilarity due to turnover.
  # For percent dissimilarity due to turnover, you need to divide by overall dissimilarity
  com.nest = part.out[[4]]
  #0: This gives the absolute amount of dissimilarity due to nestedness.
  # For percent, divide by total dissimilarity



