library(pscore)


### Name: ldensity
### Title: Density Plot for a Long Dataset
### Aliases: ldensity

### ** Examples

# simple facetted plot
pscore:::ldensity(mtcars, TRUE)
# simple coloured plot
pscore:::ldensity(mtcars, x = "mpg", g = "factor(cyl)")



