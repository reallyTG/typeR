library(cowbell)


### Name: summary.cowbell
### Title: Generates the core information of the cowbell analysis.
### Aliases: summary.cowbell

### ** Examples

# Run a simplified anaylsis with 10 iterations only (to save time.)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun, 10)
summary(test)$functionString



