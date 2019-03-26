library(cowbell)


### Name: fitted.cowbell
### Title: Implementation of the 'fitted' generic.
### Aliases: fitted.cowbell

### ** Examples

# Run a simplified anaylsis with 10 iterations only (to save time.)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun, 10)
fitted(test)



