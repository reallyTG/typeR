library(KraljicMatrix)


### Name: geom_frontier
### Title: Plotting the Pareto Optimal Frontier
### Aliases: geom_frontier stat_frontier

### ** Examples


## Not run: 
##D 
##D # default will find the efficient front in top right quadrant
##D ggplot(mtcars, aes(mpg, wt)) +
##D   geom_point() +
##D   geom_frontier()
##D 
##D # change the direction of the steps
##D ggplot(mtcars, aes(mpg, wt)) +
##D   geom_point() +
##D   geom_frontier(direction = 'hv')
##D 
##D # use quadrant parameter to change how you define the efficient frontier
##D ggplot(airquality, aes(Ozone, Temp)) +
##D   geom_point() +
##D   geom_frontier(quadrant = 'top.left')
##D 
##D ggplot(airquality, aes(Ozone, Temp)) +
##D   geom_point() +
##D   geom_frontier(quadrant = 'bottom.right')
## End(Not run)




