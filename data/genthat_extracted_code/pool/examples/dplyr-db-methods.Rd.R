library(pool)


### Name: dplyr-db-methods
### Title: DBIConnection methods from dplyr and dbplyr
### Aliases: dplyr-db-methods copy_to.Pool tbl.Pool db_analyze.Pool
###   db_begin.Pool db_commit.Pool db_create_index.Pool
###   db_create_indexes.Pool db_create_table.Pool db_data_type.Pool
###   db_desc.Pool db_drop_table.Pool db_explain.Pool db_has_table.Pool
###   db_insert_into.Pool db_list_tables.Pool db_query_fields.Pool
###   db_query_rows.Pool db_rollback.Pool db_save_query.Pool
###   db_write_table.Pool sql_escape_ident.Pool sql_escape_string.Pool
###   sql_join.Pool sql_select.Pool sql_semi_join.Pool sql_subquery.Pool
###   sql_translate_env.Pool db_collect.Pool db_compute.Pool
###   db_copy_to.Pool db_sql_render.Pool sql_escape_logical.Pool

### ** Examples

if (requireNamespace("RSQLite", quietly = TRUE)) {
  library(dplyr)

  pool <- dbPool(RSQLite::SQLite(), dbname = ":memory:")

  # describe the type of the pool/its connections
  db_desc(pool)

  # use dplyr syntax to copy a table into the database
  copy_to(pool, mtcars, "mtcars", temporary = FALSE)

  # list the current tables in the database
  db_list_tables(pool)

  # extract a table from the database
  mtcars_db <- tbl(pool, "mtcars")

  # select only 3 columns
  mtcars_db_thin <- select(mtcars_db, mpg, cyl, disp)

  # get the names of the columns in the databases's table
  db_query_fields(pool, "mtcars")

  # get the number of rows in the databases's table
  db_query_rows(pool, "mtcars")

  # drop the "mtcars" table from the database
  db_drop_table(pool, "mtcars")

  # list the current tables in the database
  db_list_tables(pool)

  poolClose(pool)

} else {
  message("Please install the 'RSQLite' package to run this example")
}



