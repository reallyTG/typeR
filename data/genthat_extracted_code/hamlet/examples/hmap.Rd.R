library(hamlet)


### Name: hmap
### Title: Plot-region based heatmap
### Aliases: hmap
### Keywords: hplot aplot

### ** Examples


# Generate some data
set.seed(1)
r1 <- replicate(30, rnorm(20))
lab <- sample(letters[1:2], 20, replace=TRUE)
r1[lab==lab[1],] <- r1[lab==lab[1],] + 2
r2a <- replicate(10, rnorm(10))
r2b <- replicate(10, rnorm(10))

# Set up a new plot region, notice we have a 2-fold wider x-axis
plot.new()
plot.window(xlim=c(0,2), ylim=c(0,1))

# Plot an example plot along with the color key and annotations for our 'lab' vector
h1 <- hmap(r1, add = TRUE)
hmap.key(h1, x1=0.18)
hmap.annotate(h1, rw = lab, rw.wid=c(0.82,0.90))

# Plot the rest to show how the coordinates are adjusted to place the heatmap(s) differently
h2a <- hmap(r2a, add = TRUE, xlim=c(1.2, 1.8), leftlim=c(1.0, 1.2), 
	rightlim=c(1.8,2.0), ylim=c(0.6, 1.0), bottomlim=c(0.5,0.6), Colv=NA)
h2b <- hmap(r2b, add = TRUE, xlim=c(1.2, 1.8), leftlim=c(1.0, 1.2), 
	rightlim=c(1.8,2.0), ylim=c(0.1, 0.5), bottomlim=c(0.0,0.1), Colv=NA)

# Show the normal plot region axes 
axis(1, at=c(0.5,1.5), c("A", "B"))

## Not run: 
##D 	# Heatmap used as base for the help documentation figure
##D 	set.seed(1)
##D 	hmap(matrix(rnorm(100), nrow=10), xlim=c(0.2,0.8), ylim=c(0.2,0.8), 
##D 		leftlim=c(0.0,0.2), rightlim=c(0.8,1.0), 
##D 		bottomlim=c(0.0,0.2), toplim=c(0.8,1.0))
##D 	axis(1); axis(2); title(xlab="x", ylab="y")
## End(Not run)



