library(pool)


### Name: DBI-connection
### Title: DBIConnection methods.
### Aliases: DBI-connection dbSendQuery,Pool-method
###   dbGetQuery,Pool,character-method dbExecute,Pool,character-method
###   dbListResults,Pool-method dbListFields,Pool,character-method
###   dbListTables,Pool-method dbReadTable,Pool,character-method
###   dbWriteTable,Pool,ANY-method dbExistsTable,Pool,ANY-method
###   dbRemoveTable,Pool,ANY-method

### ** Examples

if (requireNamespace("RSQLite", quietly = TRUE)) {
  mtcars1 <- mtcars[ c(1:16), ] # first half of the mtcars dataset
  mtcars2 <- mtcars[-c(1:16), ] # second half of the mtcars dataset

  pool <- dbPool(RSQLite::SQLite(), dbname = ":memory:")

  # write the mtcars1 table into the database
  dbWriteTable(pool, "mtcars", mtcars1, row.names = TRUE)

  # list the current tables in the database
  dbListTables(pool)

  # read the "mtcars" table from the database (only 16 rows)
  dbReadTable(pool, "mtcars")

  # append mtcars2 to the "mtcars" table already in the database
  dbWriteTable(pool, "mtcars", mtcars2, row.names = TRUE, append = TRUE)

  # read the "mtcars" table from the database (all 32 rows)
  dbReadTable(pool, "mtcars")

  # get the names of the columns in the databases's table
  dbListFields(pool, "mtcars")

  # use dbExecute to change the "mpg" and "cyl" values of the 1st row
  dbExecute(pool,
    paste(
      "UPDATE mtcars",
      "SET mpg = '22.0', cyl = '10'",
      "WHERE row_names = 'Mazda RX4'"
    )
  )

  # read the 1st row of "mtcars" table to confirm the previous change
  dbGetQuery(pool, "SELECT * FROM mtcars WHERE row_names = 'Mazda RX4'")

  # drop the "mtcars" table from the database
  dbRemoveTable(pool, "mtcars")

  # list the current tables in the database
  dbListTables(pool)

  poolClose(pool)

} else {
  message("Please install the 'RSQLite' package to run this example")
}



