library(sjdbc)


### Name: exportJDBC
### Title: Export To a JDBC-Compatible Database
### Aliases: exportJDBC
### Keywords: file interface

### ** Examples
## Not run: 
##D exportJDBC(data=fuel.frame, driverClass="com.microsoft.sqlserver.jdbc.SQLServerDriver", 
##D             con="jdbc:sqlserver://qadb-s2k:1433;databaseName=testdb;user=testqa;password=testqa;", 
##D             user="testqa", password="testqa",
##D             table="TEST1", append=F)
## End(Not run)


