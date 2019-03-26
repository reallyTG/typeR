library(RSAGA)


### Name: wind.shelter
### Title: Wind Shelter Index
### Aliases: wind.shelter wind.shelter.prep
### Keywords: spatial

### ** Examples

# Settings used by Plattner et al. (2004):
ctrl = wind.shelter.prep(6,-pi/4,pi/12,10)
## Not run: 
##D focal.function("dem.asc",fun=wind.shelter,control=ctrl,
##D     radius=6,search.mode="circle")
## End(Not run)



