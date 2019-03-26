library(cdata)


### Name: blocks_to_rowrecs_q
### Title: Map sets rows to columns (query based, take name of table).
### Aliases: blocks_to_rowrecs_q

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  # pivot example
  d <- data.frame(meas = c('AUC', 'R2'), val = c(0.6, 0.2))
  DBI::dbWriteTable(my_db,
                    'd',
                    d,
                    temporary = TRUE)
  cT <- build_pivot_control_q('d',
                              columnToTakeKeysFrom= 'meas',
                              columnToTakeValuesFrom= 'val',
                              my_db = my_db)
  tab <- blocks_to_rowrecs_q('d',
                             keyColumns = NULL,
                             controlTable = cT,
                             my_db = my_db)
  qlook(my_db, tab)
  DBI::dbDisconnect(my_db)
}




