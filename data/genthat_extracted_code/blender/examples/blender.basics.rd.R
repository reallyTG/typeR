library(blender)


### Name: blender.basics
### Title: Basic landscape calculations
### Aliases: blender.basics jstar jbar pstar

### ** Examples

  data(PLANTS)
  
  # Calculate key values for Wyoming from raw data
  landscape = PLANTS[["WY native table"]]
  
  jbar(landscape)
  jstar(landscape)
  pstar(landscape)
  
  
  # jstar and pstar also work if given row means and landscape sizes.
  # jbar requires spatial information that is lost during this averaging.
  occupancy = rowMeans(landscape)
  nsites = ncol(landscape)
  
  jstar(occupancy, nsites)
  pstar(occupancy, nsites)



