library(storr)


### Name: storr_dbi
### Title: DBI storr driver
### Aliases: storr_dbi driver_dbi

### ** Examples

if (requireNamespace("RSQLite", quietly = TRUE)) {
  st <- storr::storr_dbi("tblData", "tblKeys", RSQLite::SQLite(),
                         ":memory:")

  # Set some data:
  st$set("foo", runif(10))
  st$list()

  # And retrieve the data:
  st$get("foo")

  # These are the data tables; treat these as read only
  DBI::dbListTables(st$driver$con)

  # With recent RSQLite you'll get binary storage here:
  st$driver$binary

  # The entire storr part of the database can be removed using
  # "destroy"; this will also close the connection to the database
  st$destroy()

  # If you have a connection you want to reuse (which will the the
  # case if you are using an in-memory SQLite database for
  # multiple things within an application) it may be useful to
  # pass the connection object instead of the driver:
  con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  st <- storr::storr_dbi("tblData", "tblKeys", con)
  st$set("foo", runif(10))

  # You can then connect a different storr to the same underlying
  # storage
  st2 <- storr::storr_dbi("tblData", "tblKeys", con)
  st2$get("foo")
}



