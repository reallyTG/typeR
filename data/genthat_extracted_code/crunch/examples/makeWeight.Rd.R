library(crunch)


### Name: makeWeight
### Title: Generate a weight variable
### Aliases: makeWeight

### ** Examples

## Not run: 
##D mtcars$cyl <- as.factor(mtcars$cyl)
##D mtcars$gear <- as.factor(mtcars$gear)
##D ds <- newDataset(mtcars)
##D # Create a new "raked" variable
##D ds$weight <- makeWeight(ds$cyl ~ c(30, 30, 40, 0),
##D     ds$gear ~ c(20, 20, 60, 0), name = "weight")
##D summary(ds$weight)
##D # ds$weight is not "the weight" for the dataset unless you set it:
##D weight(ds) <- ds$weight
##D # Or, you can create the variable and set as weight in one step:
##D weight(ds) <-  makeWeight(ds$var ~ c(25, 25, 25, 25), name = "weight2")
## End(Not run)



