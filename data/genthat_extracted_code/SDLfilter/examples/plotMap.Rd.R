library(SDLfilter)


### Name: plotMap
### Title: Plot location data
### Aliases: plotMap

### ** Examples

#### Load data sets
## Fastloc GPS data obtained from two green turtles
data(turtle)
data(turtle2)
turtles<-rbind(turtle, turtle2)

#### Filter temporal and/or spatial duplicates
turtle.dup <- dupfilter(turtles, step.time=5/60, step.dist=0.001)
 

#### ddfilter
V <- est.vmax(turtle.dup)
VLP <- est.maxvlp(turtle.dup)
turtle.dd <- ddfilter(turtle.dup, vmax=V, maxvlp=VLP)


#### Plot filtered data for each animal
## using the low-resolution world map
plotMap(turtle.dd, point.size = 2, line.size = 0.5, axes.lab.size = 0, ncol=2, nrow=1)

## Not run: 
##D ## using the high-resolution google satellite images
##D plotMap(turtle.dd, point.size = 2, line.size = 0.5, axes.lab.size = 0, ncol=2, nrow=1, 
##D         bgmap = "satellite", sb.line.col = "white", sb.text.col = "white")
## End(Not run)



