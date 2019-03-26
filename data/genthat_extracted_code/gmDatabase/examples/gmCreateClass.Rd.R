library(gmDatabase)


### Name: gmCreateClass
### Title: Providing new classes and adding new users, rights groups,
###   usergroups, etc.
### Aliases: gmCreateClass gmAddMembers gmCreateRightsGroup
###   gmCreateUserGroup gmSetRights gmAddUserToGroup gmSetRightsGroup
###   gmCreateUser gmDefaultRightsGroup
### Keywords: database utilities

### ** Examples

## Not run: 
##D gmConnectServer(MySQL(), host="myServer.mydomain.edu", user="mysqlUser",
##D   passwd="mysqlPassword", dbname="myDB")
##D 
##D rg = gmCreateRightsGroup("Protected")
##D ug = gmCreateUserGroup("Admins")
##D gmSetRights("Admins","Protected",read=TRUE,write=TRUE)
##D gmAddUserToGroup("admin","Admins")
##D 
##D gmSetRightsGroup(rg,"Protected")
##D gmSetRightsGroup(ug,"Protected")
##D 
##D rg = gmCreateRightsGroup("general")
##D ug = gmCreateUserGroup("users")
##D gmSetRightsGroup(c(rg,ug),"Protected")
##D 
##D gmAddUserToGroup("admin","users")
##D gmSetRights("users", "general", read=TRUE, write=TRUE)
##D 
##D gmCreateUser("myuser","mypassword",c("users"))
##D gmCreateUser(userGroups=c("users"))
##D gmDisconnectServer()
##D 
##D gmConnectDB(server="myServer.mydomain.edu",user="mysqlUser",passwd="mysqlPassword")
##D gmDefaultRightsGroup("general")
##D 
##D gmListVariables()
##D 
##D gmCreateClass("sample","set","a material sample",parent="gmObject")
##D gmAddMembers("root","sample", required=FALSE)
##D gmClassMembers(var="sample")
##D gmAdd(root,"sample",data.frame(gmName="Sample1"))
##D 
##D gmDisconnectServer()
## End(Not run)



