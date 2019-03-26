library(ggpolypath)


### Name: gardenstate
### Title: Province polygons with inland waters as holes.
### Aliases: gardenstate

### ** Examples

gs <- ggplot(gardenstate)
gs <- gs + aes(x = x, y = y, group = group, fill = id)
gs +  geom_polypath() + geom_path()




