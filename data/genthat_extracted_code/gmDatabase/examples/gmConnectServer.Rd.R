library(gmDatabase)


### Name: gmConnectServer
### Title: Geometallurgy Database connection
### Aliases: gmCreateDB gmDisconnectServer gmListVariables
###   gmListVariableTypes gmDBSummary gmEscapeStrings gmConnectServer
###   gmRequest gmRequest,character,list,ANY-method
###   gmRequest,character,list,MySQLConnection-method
### Keywords: database

### ** Examples

## Not run: 
##D gmCreateDB(MySQL(), user="mysqlUser", password="mysqlPassword", host="mysqlServer", 
##D   dbName="myDB", admin="admin",adminPwd="myAdminPassword")
##D gmConnectServer(MySQL(), group="test", server="localhost")
##D gmListVariables(pattern=".*",db=.gmDB)
##D gmListVariableTypes(db=.gmDB)
##D gmDBSummary(db=.gmDB)
##D gmDisconnectServer()
##D 
## End(Not run)



