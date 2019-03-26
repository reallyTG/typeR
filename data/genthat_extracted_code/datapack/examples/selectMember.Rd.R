library(datapack)


### Name: selectMember
### Title: Return identifiers for objects that match search criteria
### Aliases: selectMember selectMember,DataPackage-method

### ** Examples

#' library(datapack)
dp <- new("DataPackage")
# Add the script to the DataPackage
progFile <- system.file("./extdata/pkg-example/logit-regression-example.R", package="datapack")
# An 'id' parameter is not specified, so one will be generated automatically.
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

# Now determine the package member identifier for the R script
progIds  <- selectMember(dp, name="sysmeta@formatId", value="application/R", as="character")
inputId <- selectMember(dp, name="sysmeta@fileName", value="binary.csv")



