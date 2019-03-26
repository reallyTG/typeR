library(PredictABEL)


### Name: ORunivariate
### Title: Function to compute univariate ORs for genetic predictors.
### Aliases: ORunivariate
### Keywords: manip

### ** Examples
# specify dataset with outcome and predictor variables 
data(ExampleData)
# specify column number of the outcome variable
cOutcome <- 2 
# specify column numbers of genetic predictors
cGenPreds <- c(11:13,16)

# compute univariate ORs
ORunivariate(data=ExampleData, cOutcome=cOutcome, cGenPreds=cGenPreds, 
filenameGeno="GenoOR.txt", filenameAllele="AlleleOR.txt")


