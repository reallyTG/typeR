library(datapack)


### Name: createFromTriples
### Title: Populate a ResourceMap with RDF relationships from data.frame.
### Aliases: createFromTriples createFromTriples,ResourceMap-method

### ** Examples

library(datapack)
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6")
do1 <- new("DataObject", id="id1", data, format="text/csv")
do2 <- new("DataObject", id="id2", data, format="text/csv")
dp <- addMember(dp, do1)
dp <- addMember(dp, do2)
dp <- insertRelationship(dp, subjectID="id1", objectIDs="id2", 
  predicate="http://www.w3.org/ns/prov#wasDerivedFrom")
relations <- getRelationships(dp)
resMapId <- sprintf("%s%s", "resourceMap_", uuid::UUIDgenerate())  
resMap <- new("ResourceMap", id=resMapId)
resMap <- createFromTriples(resMap, relations, getIdentifiers(dp)) 



