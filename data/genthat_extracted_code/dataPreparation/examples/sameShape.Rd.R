library(dataPreparation)


### Name: sameShape
### Title: Give same shape
### Aliases: sameShape

### ** Examples

## Not run: 
##D # Build a train and a test
##D data("messy_adult")
##D data("adult")
##D train <- messy_adult
##D test <- adult # So test will have missing columns
##D 
##D # Prepare them
##D train <- prepareSet(train, verbose = FALSE, key = "country")
##D test <- prepareSet(test, verbose = FALSE, key = "country")
##D 
##D # Give them the same shape
##D test <- sameShape(test, train)
##D # As one can see in log, a lot of small change had to be done. 
##D # This is an extreme case but you get the idea.
## End(Not run)
# "##NOT RUN:" mean that this example hasn't been run on CRAN since its long. But you can run it!



