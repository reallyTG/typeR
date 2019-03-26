library(etl)


### Name: db_type
### Title: Return the database type for an ETL or DBI connection
### Aliases: db_type db_type.src_dbi db_type.DBIConnection

### ** Examples

if (require(RMySQL) && mysqlHasDefault()) {
  # connect to test database using rs-dbi
  db <- src_mysql_cnf()
  class(db)
  db
  # connect to another server using the 'client' group
  db_type(db)
  db_type(db$con)
}



