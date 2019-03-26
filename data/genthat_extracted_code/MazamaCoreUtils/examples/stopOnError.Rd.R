library(MazamaCoreUtils)


### Name: stopOnError
### Title: Error message translator
### Aliases: stopOnError

### ** Examples

## Not run: 
##D logger.setup()
##D 
##D # Arbitrarily deep in the stack we might have:
##D myFunc <- function(x) {
##D   a <- log(x)
##D }
##D 
##D userInput <- 10
##D result <- try({
##D   myFunc(x=userInput)
##D }, silent=TRUE)
##D stopOnError(result)
##D 
##D userInput <- "ten"
##D result <- try({
##D   myFunc(x=userInput)
##D }, silent=TRUE)
##D stopOnError(result)
##D 
##D result <- try({
##D   myFunc(x=userInput)
##D }, silent=TRUE)
##D stopOnError(result, "Unable to process user input")
## End(Not run)



