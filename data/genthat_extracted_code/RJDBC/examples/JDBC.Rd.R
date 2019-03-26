library(RJDBC)


### Name: JDBC
### Title: JDBC engine
### Aliases: JDBC
### Keywords: interface

### ** Examples

## Not run: 
##D drv <- JDBC("com.mysql.jdbc.Driver",
##D   "/etc/jdbc/mysql-connector-java-3.1.14-bin.jar", "`")
##D conn <- dbConnect(drv, "jdbc:mysql://localhost/test")
##D dbListTables(conn)
##D data(iris)
##D dbWriteTable(conn, "iris", iris)
##D dbGetQuery(conn, "select count(*) from iris")
##D d <- dbReadTable(conn, "iris")
## End(Not run)



