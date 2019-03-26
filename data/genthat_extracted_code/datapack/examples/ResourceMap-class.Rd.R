library(datapack)


### Name: ResourceMap-class
### Title: ResourceMap provides methods to create, serialize and
###   deserialize an OAI ORE resource map.
### Aliases: ResourceMap-class
### Keywords: resourceMap

### ** Examples

dp <- new("DataPackage")
dp <- insertRelationship(dp, "/Users/smith/scripts/genFields.R",
    "http://www.w3.org/ns/prov#used",
    "https://knb.ecoinformatics.org/knb/d1/mn/v1/object/doi:1234/_030MXTI009R00_20030812.40.1")
relations <- getRelationships(dp)
resMap <- new("ResourceMap")
resMap <- createFromTriples(resMap, relations, getIdentifiers(dp))
## Not run: 
##D tf <- tempfile(fileext=".rdf")
##D serializeRDF(resMap, file=tf)
## End(Not run)



