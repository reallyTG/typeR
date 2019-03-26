library(simstudy)


### Name: addCorFlex
### Title: Create multivariate (correlated) data - for general
###   distributions
### Aliases: addCorFlex

### ** Examples

defC <- defData(varname = "nInds", formula = 50, dist = "noZeroPoisson", id = "idClust")

dc <- genData(10, defC)
#### Normal only

dc <- addCorData(dc, mu = c(0,0,0,0), sigma = c(2, 2, 2, 2), rho = .2,
                 corstr = "cs", cnames = c("a","b","c","d"), idname = "idClust")

di <- genCluster(dc, "idClust", "nInds", "id")

defI <- defDataAdd(varname = "A", formula = "-1 + a", variance = 3,
                   dist = "normal")
defI <- defDataAdd(defI, varname = "B", formula = "4.5 + b", variance = .5,
                   dist = "normal")
defI <- defDataAdd(defI, varname = "C", formula = "5*c", variance = 3,
                   dist = "normal")
defI <- defDataAdd(defI, varname = "D", formula = "1.6 + d", variance = 1,
                   dist = "normal")

#### Generate new data

di <- addCorFlex(di, defI, rho = 0.4, corstr = "cs")

# Check correlations by cluster

for (i in 1:nrow(dc)) {
  print(cor(di[idClust == i, list(A, B, C, D)]))
}

# Check global correlations - should not be as correlated
cor(di[, list(A, B, C, D)])



