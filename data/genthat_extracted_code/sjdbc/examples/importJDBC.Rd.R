library(sjdbc)


### Name: importJDBC
### Title: Import From a JDBC-Compatible Database
### Aliases: importJDBC
### Keywords: file interface

### ** Examples
## Not run: 
##D importJDBC(driverClass="com.microsoft.sqlserver.jdbc.SQLServerDriver", 
##D 	    con="jdbc:sqlserver://qadb-s2k:1433;databaseName=testdb;user=testqa;password=testqa;", 
##D 	    sqlQuery="SELECT * FROM FUEL_FRAME")
##D 	    
##D importJDBC(driverClass="COM.ibm.db2.jdbc.net.DB2Driver", 
##D 	    con="jdbc:db2://qadb1:6789/QATESTDB", 
##D 	    user="testqa", 
##D 	    password="testqa", 
##D 	    sqlQuery="SELECT * FROM FUEL_FRAME")
## End(Not run)


