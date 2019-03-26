library(datapack)


### Name: insertRelationship
### Title: Record relationships of objects in a DataPackage
### Aliases: insertRelationship insertRelationship,DataPackage-method

### ** Examples

dp <- new("DataPackage")
# Create a relationship
dp <- insertRelationship(dp, "/Users/smith/scripts/genFields.R",
    "http://www.w3.org/ns/prov#used",
    "https://knb.ecoinformatics.org/knb/d1/mn/v1/object/doi:1234/_030MXTI009R00_20030812.40.1")
# Create a relationshp with the subject as a blank node with an automatically assigned blank 
# node id
dp <- insertRelationship(dp, subjectID=as.character(NA), objectIDs="thing6", 
    predicate="http://www.myns.org/wasThing")
# Create a relationshp with the subject as a blank node with a user assigned blank node id
dp <- insertRelationship(dp, subjectID="urn:uuid:bc9e160e-ca21-47d5-871b-4a4820fe4451", 
      objectIDs="thing7", predicate="http://www.myns.org/hadThing")
# Create multiple relationships with the same subject, predicate, but different objects
dp <- insertRelationship(dp, subjectID="urn:uuid:95055dc1-b2a0-4a00-bdc2-05c16d048ca2", 
      objectIDs=c("thing4", "thing5"), predicate="http://www.myns.org/hadThing")
# Create multiple relationships with subject and object types specified
dp <- insertRelationship(dp, subjectID="orcid.org/0000-0002-2192-403X", 
    objectIDs="http://www.example.com/home", predicate="http://www.example.com/hadHome",
                   subjectType="uri", objectType="literal")                



