library(minval)


### Name: checkBalance
### Title: Evaluate the mass or charge balance for a set of stoichiometric
###   reactions
### Aliases: checkBalance

### ** Examples

# Loading a set of stoichiometric reactions
glycolysis <- read.csv(system.file("extdata/glycolysisModel.csv",package = "minval"), sep='\t')

# Loading extrernal chemical information
chemicalData <- read.csv2(system.file("extdata", "chemData.csv", package = "minval"))
head(chemicalData)

# Evaluating mass balance
checkBalance(
reactionList = glycolysis$REACTION,
referenceData = chemicalData,
ids = "NAME",
mFormula = "FORMULA"
)



