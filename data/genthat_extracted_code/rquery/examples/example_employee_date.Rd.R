library(rquery)


### Name: example_employee_date
### Title: build some example tables
### Aliases: example_employee_date

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  example_employee_date(my_db)
  DBI::dbDisconnect(my_db)
}




