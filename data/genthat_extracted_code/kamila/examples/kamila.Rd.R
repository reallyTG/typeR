library(kamila)


### Name: kamila
### Title: KAMILA clustering of mixed-type data.
### Aliases: kamila

### ** Examples

# Generate toy data set with poor quality categorical variables and good
# quality continuous variables.
set.seed(1)
dat <- genMixedData(200, nConVar = 2, nCatVar = 2, nCatLevels = 4,
  nConWithErr = 2, nCatWithErr = 2, popProportions = c(.5, .5),
  conErrLev = 0.3, catErrLev = 0.8)
catDf <- data.frame(apply(dat$catVars, 2, factor))
conDf <- data.frame(scale(dat$conVars))

kamRes <- kamila(conDf, catDf, numClust = 2, numInit = 10)

table(kamRes$finalMemb, dat$trueID)



