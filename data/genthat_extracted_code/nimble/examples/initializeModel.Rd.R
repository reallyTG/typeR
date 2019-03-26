library(nimble)


### Name: initializeModel
### Title: Performs initialization of nimble model node values and log
###   probabilities
### Aliases: initializeModel

### ** Examples

myNewAlgorithm <- nimbleFunction(
   setup = function(model, ...) {
      my_initializeModel <- initializeModel(model)
      ....
   },
   run = function(...) {
      my_initializeModel()
      ....
   }
)



