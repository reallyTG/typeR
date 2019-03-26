library(etl)


### Name: src_mysql_cnf
### Title: Connect to local MySQL Server using ~/.my.cnf
### Aliases: src_mysql_cnf

### ** Examples

if (require(RMySQL) && mysqlHasDefault()) {
  # connect to test database using rs-dbi
  db <- src_mysql_cnf()
  class(db)
  db
  # connect to another server using the 'client' group
  src_mysql_cnf(groups = "client")
}



