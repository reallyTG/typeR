library(tfestimators)


### Name: input_fn
### Title: Construct an Input Function
### Aliases: input_fn input_fn.default input_fn.formula input_fn.data.frame
###   input_fn.list input_fn.matrix

### ** Examples

## Not run: 
##D # Construct the input function through formula interface
##D input_fn1 <- input_fn(mpg ~ drat + cyl, mtcars)
## End(Not run)

## Not run: 
##D # Construct the input function from a data.frame object
##D input_fn1 <- input_fn(mtcars, response = mpg, features = c(drat, cyl))
## End(Not run)

## Not run: 
##D # Construct the input function from a list object
##D input_fn1 <- input_fn(
##D    object = list(
##D      feature1 = list(
##D        list(list(1), list(2), list(3)),
##D        list(list(4), list(5), list(6))),
##D      feature2 = list(
##D        list(list(7), list(8), list(9)),
##D        list(list(10), list(11), list(12))),
##D      response = list(
##D        list(1, 2, 3), list(4, 5, 6))),
##D    features = c("feature1", "feature2"),
##D    response = "response",
##D    batch_size = 10L)
## End(Not run)




