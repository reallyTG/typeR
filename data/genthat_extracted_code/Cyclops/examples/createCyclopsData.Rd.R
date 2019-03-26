library(Cyclops)


### Name: createCyclopsData
### Title: Create a Cyclops data object
### Aliases: createCyclopsData

### ** Examples

## Dobson (1990) Page 93: Randomized Controlled Trial :
counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
outcome <- gl(3, 1, 9)
treatment <- gl(3, 3)
cyclopsData <- createCyclopsData(
     counts ~ outcome + treatment,
     modelType = "pr")
cyclopsFit <- fitCyclopsModel(cyclopsData)

cyclopsData2 <- createCyclopsData(
     counts ~ outcome,
     indicatorFormula = ~ treatment,
     modelType = "pr")
summary(cyclopsData2)
cyclopsFit2 <- fitCyclopsModel(cyclopsData2)




