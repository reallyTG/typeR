library(spatstat)


### Name: Kmulti
### Title: Marked K-Function
### Aliases: Kmulti
### Keywords: spatial nonparametric

### ** Examples

     # Longleaf Pine data: marks represent diameter
    trees <- longleaf
    ## Don't show: 
        trees <- trees[seq(1,npoints(trees), by=50), ]
    
## End(Don't show)
    K <- Kmulti(trees, marks(trees) <= 15, marks(trees) >= 25)
    plot(K)
    # functions determining subsets
    f1 <- function(X) { marks(X) <= 15 }
    f2 <- function(X) { marks(X) >= 15 }
    K <- Kmulti(trees, f1, f2)
   ## Don't show: 
        rm(trees)
    
## End(Don't show)



