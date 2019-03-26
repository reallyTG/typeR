library(sjdbc)


### Name: executeJDBC
### Title: Execute SQL Query on a JDBC-Compatible Database
### Aliases: executeJDBC
### Keywords: interface

### ** Examples
## Not run: 
##D executeJDBC(driverClass="com.microsoft.sqlserver.jdbc.SQLServerDriver", 
##D             con="jdbc:sqlserver://qadb-s2k:1433;databaseName=testdb;user=testqa;password=testqa;", 
##D             user="testqa", password="testqa",
##D             sqlQuery="UPDATE TEST1 SET Weight = NULL WHERE Weight < 2500")
##D 
##D executeJDBC(driverClass="com.microsoft.sqlserver.jdbc.SQLServerDriver", 
##D             con="jdbc:sqlserver://qadb-s2k:1433;databaseName=testdb;user=testqa;password=testqa;", 
##D             user="testqa", password="testqa",
##D             sqlQuery="DROP TABLE TEST1")
## End(Not run)


