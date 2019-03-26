library(cdata)


### Name: rowrecs_to_blocks_q
### Title: Map a set of columns to rows (query based, take name of table).
### Aliases: rowrecs_to_blocks_q

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  # un-pivot example
  d <- data.frame(AUC = 0.6, R2 = 0.2)
  DBI::dbWriteTable(my_db,
                    'd',
                    d,
                    overwrite = TRUE,
                    temporary = TRUE)
  cT <- build_unpivot_control(nameForNewKeyColumn= 'meas',
                              nameForNewValueColumn= 'val',
                              columnsToTakeFrom= c('AUC', 'R2'))
  tab <- rowrecs_to_blocks_q('d', cT, my_db = my_db)
  qlook(my_db, tab)
  DBI::dbDisconnect(my_db)
}




