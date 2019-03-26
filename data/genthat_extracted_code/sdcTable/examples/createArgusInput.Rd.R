library(sdcTable)


### Name: createArgusInput
### Title: createArgusInput
### Aliases: createArgusInput

### ** Examples

# loading micro data from sdcTable
data("microData1", package="sdcTable")
microData1$num1 <- rnorm(mean=100, sd=25, nrow(microData1))
microData1$num2 <- round(rnorm(mean=500, sd=125, nrow(microData1)),2)
microData1$weight <- sample(10:100, nrow(microData1), replace=TRUE)

dim.region <- data.frame(
  levels=c('@','@@','@@','@@','@@'),
  codes=c('Total', 'A','B','C','D'),
  stringsAsFactors=FALSE)

dim.region_dupl <- data.frame(
  levels=c('@','@@','@@','@@@','@@','@@','@@@'),
  codes=c('Total', 'A','B','b1','C','D','d1'),
  stringsAsFactors=FALSE)

dim.gender <- data.frame(
  levels=c('@','@@','@@'),
  codes=c('Total', 'male','female'),
  stringsAsFactors=FALSE)

dimList <- list(region=dim.region, gender=dim.gender)
dimList_dupl  <- list(region=dim.region_dupl, gender=dim.gender)
dimVarInd <- c(1,2)
numVarInd <- 3:5
sampWeightInd <- 6

freqVarInd <- weightInd <- NULL

# creating an object of class \code{sdcProblem-class}
obj <- makeProblem(
  data=microData1,
  dimList=dimList,
  dimVarInd=dimVarInd,
  freqVarInd=freqVarInd,
  numVarInd=numVarInd,
  weightInd=weightInd,
  sampWeightInd=sampWeightInd)

# creating an object of class \code{sdcProblem-class} containing "duplicated" codes
obj_dupl <- makeProblem(
  data=microData1,
  dimList=dimList_dupl,
  dimVarInd=dimVarInd,
  freqVarInd=freqVarInd,
  numVarInd=numVarInd,
  weightInd=weightInd,
  sampWeightInd=sampWeightInd)

## create primary suppression rules
primSuppRules <- list()
primSuppRules[[1]] <- list(type="freq", n=5, rg=20)
primSuppRules[[2]] <- list(type="p", n=5, p=20)
# other supported formats are:
# list(type="nk", n=5, k=20)
# list(type="zero", rg=5)
# list(type="mis", val=1)
# list(type="wgt", val=1)
# list(type="man", val=20)

## create batchInput object
bO_md1 <- createArgusInput(obj, typ="microdata", path=getwd(), solver="FREE", method="OPT",
  primSuppRules=primSuppRules, responsevar="num1")
bO_td1 <- createArgusInput(obj, typ="tabular", path=getwd(), solver="FREE", method="OPT")
bO_td2 <- createArgusInput(obj_dupl, typ="tabular", path=getwd(), solver="FREE", method="OPT")
## Not run: 
##D ## in case CPLEX should be used, it is required to specify argument licensefile
##D bO_md2 <- createArgusInput(obj, typ="microdata", path=getwd(), solver="CPLEX", method="OPT",
##D   primSuppRules=primSuppRules, responsevar="num1", licensefile="/path/to/my/cplexlicense")
## End(Not run)



