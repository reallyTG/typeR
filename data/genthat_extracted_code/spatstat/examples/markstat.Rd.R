library(spatstat)


### Name: markstat
### Title: Summarise Marks in Every Neighbourhood in a Point Pattern
### Aliases: markstat
### Keywords: spatial programming

### ** Examples

  trees <- longleaf
  ## Don't show: 
     trees <- trees[seq(1, npoints(trees), by=6)]
  
## End(Don't show)

  # average diameter of 5 closest neighbours of each tree
  md <- markstat(trees, mean, N=5)

  # range of diameters of trees within 10 metre radius
  rd <- markstat(trees, range, R=10)



