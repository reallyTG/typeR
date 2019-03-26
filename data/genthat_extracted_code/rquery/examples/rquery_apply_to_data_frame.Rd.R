library(rquery)


### Name: rquery_apply_to_data_frame
### Title: Execute optree in an environment where d is the only data.
### Aliases: rquery_apply_to_data_frame

### ** Examples


# WARNING: example tries to change rquery.rquery_db_executor option to RSQLite and back.
if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(db)
  old_o <- options(list("rquery.rquery_db_executor" = list(db = db)))

  optree <- mk_td("d", c("AUC", "R2", "D")) %.>%
  	extend(., c %:=% sqrt(R2)) %.>%
    orderby(., cols = "R2", reverse = "R2")

  d <- data.frame(AUC = 0.6, R2 = c(0.1, 0.2), D = NA, z = 2)
  v <- rquery_apply_to_data_frame(d, optree)
  print(v)

  # now load up a table without an R2 column,
  # want to show this is caught
  d <- data.frame(z = 1)
  tryCatch(
     rquery_apply_to_data_frame(d, optree),
     error = function(e) { as.character(e) }
    ) %.>%
    print(.)

  options(old_o)
  DBI::dbDisconnect(db)
}




