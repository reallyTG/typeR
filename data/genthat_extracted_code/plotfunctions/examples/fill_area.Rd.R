library(plotfunctions)


### Name: fill_area
### Title: Utility function
### Aliases: fill_area

### ** Examples

# density of a random sample from normal distribution:
test <- density(rnorm(1000))
emptyPlot(range(test$x), range(test$y))
fill_area(test$x, test$y)
fill_area(test$x, test$y, from=.1, col='red')
fill_area(test$x, test$y, from=.2, col='blue', density=10, lwd=3)
lines(test$x, test$y, lwd=2)




