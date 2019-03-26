library(cowbell)


### Name: residuals.cowbell
### Title: Implementation of the 'residuals' generic.
### Aliases: residuals.cowbell

### ** Examples

# Run a simplified anaylsis with 10 iterations only (to save time.)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun, 10)
residuals(test)



