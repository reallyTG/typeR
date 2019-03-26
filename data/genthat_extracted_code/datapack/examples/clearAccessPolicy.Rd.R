library(datapack)


### Name: clearAccessPolicy
### Title: Clear the accessPolicy from the specified object.
### Aliases: clearAccessPolicy clearAccessPolicy,SystemMetadata-method
###   clearAccessPolicy,DataObject-method
###   clearAccessPolicy,DataPackage-method

### ** Examples

# Clear access policy for a SystemMetadata object.
sysmeta <- new("SystemMetadata")
sysmeta <- addAccessRule(sysmeta, "uid=smith,ou=Account,dc=example,dc=com", "write")
sysmeta <- clearAccessPolicy(sysmeta)
# Clear access policy for a DataObject
do <- new("DataObject", format="text/csv", filename=system.file("extdata/sample-data.csv", 
          package="datapack"))
do <- addAccessRule(do, "uid=smith,ou=Account,dc=example,dc=com", "write")
do <- clearAccessPolicy(do)
# Clear access policy for a DataPackage
dp <- new("DataPackage")
data <- charToRaw("1,2,3\n4,5,6\n")
obj <- new("DataObject", dataobj=data, format="text/csv")
dp <- addMember(dp, obj)
data2 <- charToRaw("7,8,9\n4,10,11\n")
obj2 <- new("DataObject", dataobj=data2, format="text/csv")
dp <- addMember(dp, obj2)

# Add the access rule to all package members
dp <- addAccessRule(dp, "uid=smith,ou=Account,dc=example,dc=com", 
    permission="write")
# Now clear the access policy for just the second object 
dp <- clearAccessPolicy(dp, getIdentifier(obj2))




