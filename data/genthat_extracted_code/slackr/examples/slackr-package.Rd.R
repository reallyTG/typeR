library(slackr)


### Name: slackr-package
### Title: slackr-package
### Aliases: slackr-package

### ** Examples

## Not run: 
##D slackr_setup()
##D 
##D # send objects
##D slackr("iris info", head(iris), str(iris))
##D 
##D # send images
##D library(ggplot2)
##D qplot(mpg, wt, data=mtcars)
##D dev.slack("#results")
##D 
##D ggslackr(qplot(mpg, wt, data=mtcars))
##D 
## End(Not run)



