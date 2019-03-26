library(datapack)


### Name: getRelationships
### Title: Retrieve relationships of package objects
### Aliases: getRelationships getRelationships,DataPackage-method

### ** Examples

dp <- new("DataPackage")
insertRelationship(dp, "/Users/smith/scripts/genFields.R",
    "http://www.w3.org/ns/prov#used",
    "https://knb.ecoinformatics.org/knb/d1/mn/v1/object/doi:1234/_030MXTI009R00_20030812.40.1")
rels <- getRelationships(dp)



