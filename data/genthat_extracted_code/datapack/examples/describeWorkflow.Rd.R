library(datapack)


### Name: describeWorkflow
### Title: Add data derivation information to a DataPackage
### Aliases: describeWorkflow describeWorkflow,DataPackage-method

### ** Examples

library(datapack)
dp <- new("DataPackage")
# Add the script to the DataPackage
progFile <- system.file("./extdata/pkg-example/logit-regression-example.R", package="datapack")
progObj <- new("DataObject", format="application/R", filename=progFile)
dp <- addMember(dp, progObj)

# Add a script input to the DataPackage
inFile <- system.file("./extdata/pkg-example/binary.csv", package="datapack") 
inObj <- new("DataObject", format="text/csv", filename=inFile)
dp <- addMember(dp, inObj)

# Add a script output to the DataPackage
outFile <- system.file("./extdata/pkg-example/gre-predicted.png", package="datapack")
outObj <- new("DataObject", format="image/png", file=outFile)
dp <- addMember(dp, outObj)

# Add the provenenace relationshps, linking the input and output to the script execution
# Note: 'sources' and 'derivations' can also be lists of "DataObjects" or "DataObject' identifiers
dp <- describeWorkflow(dp, sources = inObj, program = progObj, derivations = outObj) 
# View the results
head(getRelationships(dp))



