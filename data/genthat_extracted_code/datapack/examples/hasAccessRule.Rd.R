library(datapack)


### Name: hasAccessRule
### Title: Determine if an access rules exists
### Aliases: hasAccessRule hasAccessRule,SystemMetadata-method
###   hasAccessRule,DataObject-method hasAccessRule,DataPackage-method

### ** Examples

#
# Check access rules for a SystemMetadata object.
sysmeta <- new("SystemMetadata")
sysmeta <- addAccessRule(sysmeta, "uid=smith,ou=Account,dc=example,dc=com", "write")
accessRules <- data.frame(subject=c("uid=smith,ou=Account,dc=example,dc=com", 
  "uid=slaughter,o=unaffiliated,dc=example,dc=org"), permission=c("write", "changePermission"))
sysmeta <- addAccessRule(sysmeta, accessRules)
ruleExists <- hasAccessRule(sysmeta, subject="uid=smith,ou=Account,dc=example,dc=com", 
  permission="write")
#
# Check access rules for a DataObject
data <- system.file("extdata/sample-data.csv", package="datapack")
do <- new("DataObject", file=system.file("./extdata/sample-data.csv", package="datapack"), 
                                         format="text/csv")
do <- setPublicAccess(do)
isPublic <- hasAccessRule(do, "public", "read")
accessRules <- data.frame(subject=c("uid=smith,ou=Account,dc=example,dc=com", 
                          "uid=wiggens,o=unaffiliated,dc=example,dc=org"), 
                          permission=c("write", "changePermission"), 
                          stringsAsFactors=FALSE)
do <- addAccessRule(do, accessRules)
SmithHasWrite <- hasAccessRule(do, "uid=smith,ou=Account,dc=example,dc=com", "write")
#
# Check access rules for member DataObjects of a DataPackage.
# First create an example DataPackage
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", id="id1", dataobj=data, format="text/csv")
dp <- addMember(dp, obj)
data2 <- charToRaw("7,8,9\n4,10,11\n")
obj2 <- new("DataObject", id="id2", dataobj=data2, format="text/csv")
dp <- addMember(dp, obj2)
# Add access rules to all package members
dp <- addAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", "write")
dp <- addAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", "changePermission")
hasWrite <- hasAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", "write")
hasChange <- hasAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", "changePermission")



