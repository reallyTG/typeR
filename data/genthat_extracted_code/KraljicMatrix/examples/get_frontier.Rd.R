library(KraljicMatrix)


### Name: get_frontier
### Title: Compute the Pareto Optimal Frontier
### Aliases: get_frontier

### ** Examples


# default will find the Pareto optimal observations in top right quadrant
get_frontier(mtcars, mpg, wt)

# the output can be in descending or ascending order
get_frontier(mtcars, mpg, wt, decreasing = FALSE)

# use quadrant parameter to change how you define the efficient frontier
get_frontier(airquality, Ozone, Temp, quadrant = 'top.left')

get_frontier(airquality, Ozone, Temp, quadrant = 'bottom.right')




