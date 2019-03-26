library(rquery)


### Name: apply_right.relop
### Title: Execute pipeline treating pipe_left_arg as local data to be
###   copied into database.
### Aliases: apply_right.relop

### ** Examples


# WARNING: example tries to change rquery.rquery_db_executor option to RSQLite and back.
if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  # set up example database and
  # db execution helper
  db <- DBI::dbConnect(RSQLite::SQLite(),
                       ":memory:")
  RSQLite::initExtension(db)
  old_o <- options(list("rquery.rquery_db_executor" = list(db = db)))

  # operations pipeline/tree
  optree <- mk_td("d", "x") %.>%
    extend(., y = x*x)

  # wrapr dot pipe apply_right dispatch
  # causes this statment to apply optree
  # to d.
  data.frame(x = 1:3) %.>% optree %.>% print(.)

  # remote example
  rq_copy_to(db, "d",
              data.frame(x = 7:8),
              overwrite = TRUE,
              temporary = TRUE)

  # wrapr dot pipe apply_right dispatch
  # causes this statment to apply optree
  # to db.
  db %.>% optree %.>% print(.)

  # clean up
  options(old_o)
  DBI::dbDisconnect(db)
}




