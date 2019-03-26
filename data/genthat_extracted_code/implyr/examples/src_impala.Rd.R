library(implyr)


### Name: src_impala
### Title: Connect to Impala and create a remote dplyr data source
### Aliases: src_impala

### ** Examples

# Using ODBC connectivity:

## Not run: 
##D library(odbc)
##D drv <- odbc::odbc()
##D impala <- src_impala(
##D   drv = drv,
##D   driver = "Cloudera ODBC Driver for Impala",
##D   host = "host",
##D   port = 21050,
##D   database = "default",
##D   uid = "username",
##D   pwd = "password"
##D )
## End(Not run)

# Using JDBC connectivity:

## Not run: 
##D library(RJDBC)
##D Sys.setenv(JAVA_HOME = "/path/to/java/home/")
##D impala_classpath <- list.files(
##D   path = "/path/to/jdbc/driver",
##D   pattern = "\\.jar$",
##D   full.names = TRUE
##D )
##D .jinit(classpath = impala_classpath)
##D drv <- JDBC(
##D   driverClass = "com.cloudera.impala.jdbc41.Driver",
##D   classPath = impala_classpath,
##D   identifier.quote = "`"
##D )
##D impala <- src_impala(
##D   drv,
##D   "jdbc:impala://host:21050",
##D   "username",
##D   "password"
##D )
## End(Not run)



