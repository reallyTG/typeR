library(cowbell)


### Name: print.summary.cowbell
### Title: Prints the summary obtained by 'summary.cowbell'.
### Aliases: print.summary.cowbell

### ** Examples

# Run a simplified anaylsis with 10 iterations only (to save time.)
concept<-generateCowbellConcept(Fun ~ Fluency * Absorption, 1, 9, 1, 7, 1, 7)
data(allFun)
test<-generateCowbell(concept, allFun, 10)
summary(test)



