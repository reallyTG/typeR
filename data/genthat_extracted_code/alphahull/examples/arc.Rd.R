library(alphahull)


### Name: arc
### Title: Add an arc to a plot
### Aliases: arc
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Plot of the circumference of radius 1
##D theta <- seq(0, 2*pi, length = 100)
##D r <- 1
##D plot(r*cos(theta), r*sin(theta), type = "l")
##D # Add in red the arc between pi/4 and 3*pi/4
##D arc(c(0,0), 1, c(0,1), pi/4, col = 2, lwd = 2)
## End(Not run)



