library(forestChange)


### Name: FCPolygon
### Title: Forest-Cover Polygon
### Aliases: FCPolygon

### ** Examples

## A list of departments of Colombia is printed:
 ## No test: 
     dep <- FCPolygon(level = 1)
     head(dep)
 
## End(No test)
## Two adjacent layers of GFC must be bounded together before cropping
## the GFC data using the boundaries of the the municipality of
## 'Cumaribo' in Colombia. This is automatically developed by
## FCPolygon:
 ## No test: 
 cumariboArea <- FCPolygon(pol = 'Cumaribo')
 
## End(No test)
## The name 'Mosquera' matchs two municipalities of Colombia. A
## corresponding department should be specified in the argument 'pol'
## of FCPolygon:
 ## No test: 
 mosquera <- FCPolygon('Mosquera')
 mosqueraNarinho <- FCPolygon(pol = c('Mosquera','Narino'))
 
## End(No test)



