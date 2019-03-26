library(raster)


### Name: as.character
### Title: Character representation of a Raster or Extent object
### Aliases: as.character as.character,Raster-method
###   as.character,Extent-method
### Keywords: spatial methods

### ** Examples

r <- raster(ncol=3, nrow=3)
values(r) <- 1:ncell(r)
as.character(r)
s <- stack(r, r)
as.character(s)
as.character(extent(s))

x <- as.character(s)
eval(parse(text=x))

y <- as.character(extent(s))
eval(parse(text=y))



