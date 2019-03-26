library(cowbell)


### Name: predict.cowbell
### Title: Performs a prediction on the cowbell model that has been
###   generated.
### Aliases: predict.cowbell

### ** Examples

# Run a simplified anaylsis with 10 iterations only (to save time.)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun, 10)
predict(test)



