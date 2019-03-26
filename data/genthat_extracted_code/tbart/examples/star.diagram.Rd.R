library(tbart)


### Name: star.diagram
### Title: Creates the lines for a 'star diagram'
### Aliases: star.diagram

### ** Examples

data(meuse)
coordinates(meuse) <- ~x+y
allocations.list <- allocate(meuse,p=5)
star.lines <- star.diagram(meuse,alloc=allocations.list)
plot(star.lines)

# Acquire allocations from swdf1
require(GISTools)
set.seed(461976) # Reproducibility
data(georgia)
georgia3 <- allocations(georgia2,p=8)
plot(georgia3,border='grey')
plot(star.diagram(georgia3),col='darkblue',lwd=2,add=TRUE)



