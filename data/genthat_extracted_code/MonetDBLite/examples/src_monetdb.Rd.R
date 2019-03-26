library(MonetDBLite)


### Name: src_monetdb
### Title: dplyr integration from MonetDBLite
### Aliases: src_monetdb src_monetdblite

### ** Examples

library(dplyr)
# To connect to a database first create a src:
dbdir <- file.path(tempdir(), "dplyrdir")
my_db <- MonetDBLite::src_monetdblite(dbdir)

# copy some data to DB
my_iris  <- copy_to(my_db, iris)

# create table object
my_iris2 <- tbl(my_db, 'iris')

# now you can call regular dplyr methods on table object

# ...

# shut down the database
MonetDBLite::monetdblite_shutdown()



