library(sjdbc)


### Name: sjdbcOptions
### Title: Package Options and Defaults
### Aliases: sjdbcOptions
### Keywords: interface

### ** Examples

# set a single option
sjdbcOptions(driverClass="COM.ibm.db2.jdbc.net.DB2Driver")

# set multiple options
sjdbcOptions(driverClass="COM.ibm.db2.jdbc.net.DB2Driver", 
	    con="jdbc:db2://qadb1:6789/QATESTDB", 
	    user="testqa", 
	    password="testqa")



