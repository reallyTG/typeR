library(adehabitatMA)


### Name: join
### Title: Finds the Value of Mapped Variables at some Specified Locations
###   (Spatial Join)
### Aliases: join
### Keywords: programming hplot

### ** Examples

data(lynxjura)

## show the data
image(lynxjura$map)
points(lynxjura$locs)

## join the data to the maps:
res <- join(lynxjura$locs, lynxjura$map)
head(res)




