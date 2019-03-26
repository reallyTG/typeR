library(mosaicModel)


### Name: mod_error
### Title: Mean square prediction error
### Aliases: mod_error

### ** Examples

mod <- lm(mpg ~ hp + wt, data = mtcars)
mod_error(mod) # In-sample prediction error.
## Not run: 
##D classifier <- rpart::rpart(Species ~ ., data = iris)
##D mod_error(classifier)
##D mod_error(classifier, error_type = "LL") 
##D # More typically
##D inds <- sample(1:nrow(iris), size = 100)
##D Training <- iris[inds, ]
##D Testing  <- iris[ - inds, ]
##D classifier <- rpart::rpart(Species ~ ., data = Training)
##D # This may well assign zero probability to events that appeared in the
##D # Testing data 
##D mod_error(classifier, testdata = Testing)
##D mod_error(classifier, testdata = Testing, error_type = "mse")
## End(Not run)



