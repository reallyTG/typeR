library(datapack)


### Name: serializeRDF
### Title: Serialize a ResouceMap.
### Aliases: serializeRDF serializeRDF,ResourceMap-method

### ** Examples

dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do1 <- new("DataObject", id="id1", data, format="text/csv")
do2 <- new("DataObject", id="id2", data, format="text/csv")
dp <- addMember(dp, do1)
dp <- addMember(dp, do2)
dp <- insertRelationship(dp, subjectID="id1", objectIDs="id2", 
  predicate="http://www.w3.org/ns/prov#wasDerivedFrom")
relations <- getRelationships(dp)
resmap <- new("ResourceMap")
resmap <- createFromTriples(resmap, relations, id="myuniqueid")
## Not run: 
##D tf <- tempfile(fileext=".xml")
##D serializeRDF(resmap, tf)
## End(Not run)



