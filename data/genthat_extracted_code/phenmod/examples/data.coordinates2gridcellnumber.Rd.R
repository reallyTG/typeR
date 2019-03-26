library(phenmod)


### Name: data.coordinates2gridcellnumber
### Title: Search number of gridcell for given coordinates.
### Aliases: data.coordinates2gridcellnumber

### ** Examples

  ## load grid containing spatial information
  data(relatedGrid)

  ## search position in grid
  xy <- util.geoco2gk(54.12,10.17,4)
  gridposition <- data.coordinates2gridcellnumber(grid=relatedGrid, 
	x=xy[,1],y=xy[,2])

  gridposition



