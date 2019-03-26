library(plotfunctions)


### Name: add_n_points
### Title: Add groups of points to a plot
### Aliases: add_n_points

### ** Examples


s <- table(cars$speed)
d <- tapply(cars$dist, list(cars$speed), mean)

emptyPlot(range(as.numeric(names(s))), range(d), 
    xlab="dist", ylab="mean speed")
add_n_points(as.numeric(names(s)), d, s)

# decrease space between groups of points:
emptyPlot(range(as.numeric(names(s))), range(d), 
    xlab="dist", ylab="mean speed")
add_n_points(as.numeric(names(s)), d, s, sep=0)

# decrease width of groups of points:
emptyPlot(range(as.numeric(names(s))), range(d), 
    xlab="dist", ylab="mean speed")
add_n_points(as.numeric(names(s)), d, s, width=0.8)

# horizontal vs vertical:
emptyPlot(range(d),range(as.numeric(names(s))),  
    ylab="dist", xlab="mean speed")
add_n_points(d, as.numeric(names(s)), s, horiz=FALSE) 




