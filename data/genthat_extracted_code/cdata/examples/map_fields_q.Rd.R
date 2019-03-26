library(cdata)


### Name: map_fields_q
### Title: Map field values from one column into new derived columns (query
###   based, takes name of table).
### Aliases: map_fields_q

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(),
                          ":memory:")
  DBI::dbWriteTable(
    my_db,
    'd',
    data.frame(what = c("acc", "loss",
                        "val_acc", "val_loss"),
               score = c(0.8, 1.2,
                         0.7, 1.7),
               stringsAsFactors = FALSE),
    overwrite = TRUE,
    temporary = TRUE)
  DBI::dbWriteTable(
    my_db,
    'm',
    data.frame(what = c("acc", "loss",
                        "val_acc", "val_loss"),
               measure = c("accuracy", "log-loss",
                           "accuracy", "log-loss"),
               dataset = c("train", "train", "validation", "validation"),
               stringsAsFactors = FALSE),
    overwrite = TRUE,
    temporary = TRUE)

  map_fields_q('d', 'what', 'm', my_db, "dm")
  cdata::qlook(my_db, 'dm')
  DBI::dbDisconnect(my_db)
}




