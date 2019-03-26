library(sparsebnUtils)


### Name: sparsebnData
### Title: sparsebnData class
### Aliases: sparsebnData sparsebnData is.sparsebnData
###   sparsebnData.data.frame sparsebnData.matrix print.sparsebnData
###   summary.sparsebnData plot.sparsebnData

### ** Examples


### Generate a random continuous dataset
mat <- matrix(rnorm(1000), nrow = 20)
dat <- sparsebnData(mat, type = "continuous") # purely observational data with continuous variables

### Discrete data
mat <- rbind(c(0,2,0),
             c(1,1,0),
             c(1,0,3),
             c(0,1,0))
dat.levels <- list(c(0,1), c(0,1,2), c(0,1,2,3))
dat <- sparsebnData(mat,
                    type = "discrete",
                    levels = dat.levels) # purely observational data with discrete variables

dat.ivn <- list(c(1),   # first observation was intervened at node 1
                c(1),   # second observation was intervened at node 1
                c(2,3), # third observation was intervened at nodes 2 and 3
                c(1,3)) # fourth observation was intervened at nodes 1 and 3
dat <- sparsebnData(mat,
                    type = "discrete",
                    levels = dat.levels,
                    ivn = dat.ivn) # specify intervention rows




