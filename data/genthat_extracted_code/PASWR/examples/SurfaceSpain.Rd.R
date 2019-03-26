library(PASWR)


### Name: SurfaceSpain
### Title: Surface Area for Spanish Communities
### Aliases: SurfaceSpain
### Keywords: datasets

### ** Examples

with(data = SurfaceSpain,
barplot(surface, names.arg=community, las=2))
# Trellis Approach
barchart(community~surface, data=SurfaceSpain)



