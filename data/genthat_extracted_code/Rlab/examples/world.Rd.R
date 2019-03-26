library(Rlab)


### Name: world
### Title: Plot of the world
### Aliases: world
### Keywords: hplot

### ** Examples

# Draw map in device color number 2 
world( col=2 )
# add the US
US( add=TRUE )

## Western Europe (*which* big island is missing ?)
## with a (light color!) coordinate grid:

world(xlim=c(-10,18),ylim=c(36,60), xaxt = "s", yaxt = "s")
grid()





