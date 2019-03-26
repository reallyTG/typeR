library(spatstat)


### Name: Gmulti
### Title: Marked Nearest Neighbour Distance Function
### Aliases: Gmulti
### Keywords: spatial nonparametric

### ** Examples

    trees <- longleaf
     # Longleaf Pine data: marks represent diameter
    ## Don't show: 
      trees <- trees[seq(1, npoints(trees), by=50), ]
    
## End(Don't show)
    Gm <- Gmulti(trees, marks(trees) <= 15, marks(trees) >= 25)
    plot(Gm)



