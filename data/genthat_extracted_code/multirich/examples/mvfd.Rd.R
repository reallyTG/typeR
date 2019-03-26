library(multirich)


### Name: mvfd
### Title: mvfd Main function to calculate functional richness
### Aliases: mvfd

### ** Examples

# Compare functional diveristy between species using the Iris dataset
ind.mat = iris
ind.mat$Species = NULL
ind.lbl = sprintf("Ind_%s",seq(1,nrow(iris)))
ind.mat = as.matrix(ind.mat) #Needs to be in matrix format
rownames(ind.mat) = ind.lbl
com.base = iris$Species
pool = rep(1,nrow(iris))
com1 = sapply(com.base, function(x){ifelse(x == "setosa",1,0)})
com2 = sapply(com.base, function(x){ifelse(x == "versicolor",1,0)})
com3 = sapply(com.base, function(x){ifelse(x == "virginica",1,0)})
com.vec = c(pool,com1,com2,com3)
com.lbl = c("pool","com1","com2","com3")
com.mat = matrix(com.vec,nrow = 4,byrow = TRUE,dimnames = list(com.lbl,ind.lbl))

mvr.out = mvfd(ind.mat,com.mat)



