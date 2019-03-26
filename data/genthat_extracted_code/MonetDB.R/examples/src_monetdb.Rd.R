library(MonetDB.R)


### Name: src_monetdb
### Title: dplyr integration from MonetDB.R
### Aliases: src_monetdb tbl.src_monetdb src_desc.src_monetdb
###   src_translate_env.src_monetdb sample_frac.tbl_monetdb
###   sample_n.tbl_monetdb db_analyze.MonetDBConnection
###   db_create_index.MonetDBConnection db_insert_into.MonetDBConnection
###   db_query_fields.MonetDBConnection db_query_rows.MonetDBConnection
###   db_query_fields.MonetDBEmbeddedConnection
###   db_query_rows.MonetDBEmbeddedConnection
###   db_save_query.MonetDBConnection sql_subquery.MonetDBConnection

### ** Examples

## Not run: 
##D library(dplyr)
##D # Connection basics ---------------------------------------------------------
##D # To connect to a database first create a src:
##D my_db <- MonetDB.R::src_monetdb(dbname="demo")
##D # Then reference a tbl within that src
##D my_tbl <- tbl(my_db, "my_table")
## End(Not run)



