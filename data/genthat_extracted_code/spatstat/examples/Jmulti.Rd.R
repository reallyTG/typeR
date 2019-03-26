library(spatstat)


### Name: Jmulti
### Title: Marked J Function
### Aliases: Jmulti
### Keywords: spatial nonparametric

### ** Examples

    trees <- longleaf
     # Longleaf Pine data: marks represent diameter
    ## Don't show: 
        trees <- trees[seq(1,npoints(trees), by=50)]
    
## End(Don't show)
    Jm <- Jmulti(trees, marks(trees) <= 15, marks(trees) >= 25)
    plot(Jm)



