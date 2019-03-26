library(RODBC)


### Name: setSqlTypeInfo
### Title: Specify or Query a Mapping of R Types to DBMS Types
### Aliases: setSqlTypeInfo getSqlTypeInfo
### Keywords: IO database

### ** Examples
## Not run: 
##D getSqlTypeInfo()
##D getSqlTypeInfo("MySQL")
##D setSqlTypeInfo("Microsoft SQL Server",
##D                list(double="float", integer="int",
##D                     character="varchar(255)", logical="varchar(5)"))
## End(Not run)


