library(rapportools)


### Name: label
### Title: Get Variable Label
### Aliases: label rp.label

### ** Examples

## Not run: 
##D x <- rnorm(100)
##D label(x)         # returns "x"
##D label(x, FALSE)  # returns NA and issues a warning
##D 
##D label(mtcars$hp) <- "Horsepower"
##D label(mtcars)         # returns "Horsepower" instead of "hp"
##D label(mtcars, FALSE)  # returns NA where no labels are found
##D label(sleep, FALSE)   # returns NA for each variable and issues a warning
## End(Not run)



