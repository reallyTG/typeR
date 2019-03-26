library(vetools)


### Name: get.shape.state
### Title: Retrive SHAPE files
### Aliases: get.shape.state get.shape.venezuela
### Keywords: shapefile

### ** Examples

## Get national boudary SHAPE
VE <- get.shape.venezuela()
## Not run: plot(VE, asp=1, axes=T)

## Get list of all available shapes
get.shape.state()

## Get national and statal boudaries SHAPE
VS <- get.shape.state(get.shape.state()$Abb)
## Not run: plot(VS, col="gray80", asp=1, axes=F)

## Retrieve Zone III states
BOAMDA = get.shape.state(c("BO", "AM", "DA"))
## Not run: plot(BOAMDA, add=T, border="darkred", lwd=2, col="pink")



