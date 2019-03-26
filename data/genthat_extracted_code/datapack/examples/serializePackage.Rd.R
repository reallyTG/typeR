library(datapack)


### Name: serializePackage
### Title: Create an OAI-ORE resource map from the package
### Aliases: serializePackage serializePackage,DataPackage-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do <- new("DataObject", id="do1", dataobj=data, format="text/csv", user="jsmith")
dp <- addMember(dp, do)
data2 <- charToRaw("7,8,9\n10,11,12")
do2 <- new("DataObject", id="do2", dataobj=data2, format="text/csv", user="jsmith")
dp <- addMember(dp, do2)
dp <- describeWorkflow(dp, sources=do, derivations=do2)
## Not run: 
##D td <- tempdir()
##D status <- serializePackage(dp, file=paste(td, "resmap.json", sep="/"), syntaxName="json",  
##D     mimeType="application/json")
##D status <- serializePackage(dp, file=paste(td, "resmap.xml", sep="/"), syntaxName="rdfxml", 
##D     mimeType="application/rdf+xml")
##D status <- serializePackage(dp, file=paste(td, "resmap.ttl", sep="/"), syntaxName="turtle", 
##D     mimeType="text/turtle")
## End(Not run)



