library(sdcTable)


### Name: makeProblem
### Title: create 'sdcProblem-class'-objects
### Aliases: makeProblem

### ** Examples

# loading micro data
data("microData1", package="sdcTable")
microData <- microData1; rm(microData1)
# having a look at the data structure
str(microData)

# we can observe that we have a micro data set consisting
# of two spanning variables ('region' and 'gender') and one
# numeric variable ('val')

# specify structure of hierarchical variable 'region'
# levels 'A' to 'D' sum up to a Total
dim.region <- data.frame(
 levels=c('@','@@','@@','@@','@@'),
 codes=c('Total', 'A','B','C','D'),
 stringsAsFactors=FALSE)

# specify structure of hierarchical variable 'gender'
# using create_node() and add_nodes() (see ?manage_hierarchies)
dim.gender <- hier_create(root = "Total", nodes = c("male", "female"))
hier_display(dim.gender)

# create a named list with each element being a data-frame
# containing information on one dimensional variable and
# the names referring to variables in the input data
dimList <- list(region=dim.region, gender=dim.gender)

# third column containts a numeric variable
numVarInd <- 3

# no variables holding counts, numeric values, weights or sampling
# weights are available in the input data
freqVarInd <- weightInd <- sampWeightInd <- NULL

# creating an object of class \code{sdcProblem-class}
problem <- makeProblem(
 data=microData,
 dimList=dimList,
 freqVarInd=freqVarInd,
 numVarInd=numVarInd,
 weightInd=weightInd,
 sampWeightInd=sampWeightInd)

# what do we have?
print(class(problem))

# have a look at the data
sdcProb2df(problem, addDups=TRUE,
  addNumVars=TRUE, dimCodes="original")



