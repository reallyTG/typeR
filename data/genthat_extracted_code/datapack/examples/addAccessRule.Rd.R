library(datapack)


### Name: addAccessRule
### Title: Add access rules to the specified object.
### Aliases: addAccessRule addAccessRule,SystemMetadata-method
###   addAccessRule,DataObject-method addAccessRule,DataPackage-method

### ** Examples

# Add an access rule to a SystemMetadata access policy.
# Parameter "y" can be character string containing the subject of the access rule:
sysmeta <- new("SystemMetadata")
sysmeta <- addAccessRule(sysmeta, "uid=smith,ou=Account,dc=example,dc=com", "write")
accessRules <- data.frame(subject=c("uid=smith,ou=Account,dc=example,dc=com", 
  "uid=slaughter,o=unaffiliated,dc=example,dc=org"), permission=c("write", "changePermission"))
sysmeta <- addAccessRule(sysmeta, accessRules)
# Alternatively, parameter "y" can be a data.frame containing one or more access rules:
sysmeta <- addAccessRule(sysmeta, "uid=smith,ou=Account,dc=example,dc=com", "write")
accessRules <- data.frame(subject=c("uid=smith,ou=Account,dc=example,dc=com", 
  "uid=slaughter,o=unaffiliated,dc=example,dc=org"), permission=c("write", "changePermission"))
sysmeta <- addAccessRule(sysmeta, accessRules)
# Add an access rule to a DataObject
data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", id="1234", dataobj=data, format="text/csv")
obj <- addAccessRule(obj, "uid=smith,ou=Account,dc=example,dc=com", "write")
# Add an access rule to members of a DataPackage
# First create a sample DataPackage
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", id="id1", dataobj=data, format="text/csv")
dp <- addMember(dp, obj)
data2 <- charToRaw("7,8,9\n4,10,11\n")
obj2 <- new("DataObject", id="id2", dataobj=data2, format="text/csv")
dp <- addMember(dp, obj2)
# Add access rule to all package members
dp <- addAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", "write", getIdentifiers(dp))



