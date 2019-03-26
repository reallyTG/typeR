library(cdata)


### Name: blocks_to_rowrecs
### Title: Map sets rows to columns (takes a 'data.frame').
### Aliases: blocks_to_rowrecs blocks_to_rowrecs.default
###   blocks_to_rowrecs.relop

### ** Examples


  # pivot example
  d <- data.frame(meas = c('AUC', 'R2'),
                  val = c(0.6, 0.2))

  cT <- build_pivot_control(d,
                            columnToTakeKeysFrom= 'meas',
                            columnToTakeValuesFrom= 'val')
  blocks_to_rowrecs(d,
                    keyColumns = NULL,
                    controlTable = cT)


d <- data.frame(meas = c('AUC', 'R2'),
                val = c(0.6, 0.2))
cT <- build_pivot_control(
  d,
  columnToTakeKeysFrom= 'meas',
  columnToTakeValuesFrom= 'val')

ops <- rquery::local_td(d) %.>%
  blocks_to_rowrecs(.,
                    keyColumns = NULL,
                    controlTable = cT)
cat(format(ops))

if(requireNamespace("rqdatatable", quietly = TRUE)) {
  library("rqdatatable")
  d %.>%
    ops %.>%
    print(.)
}

if(requireNamespace("RSQLite", quietly = TRUE)) {
  db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  DBI::dbWriteTable(db,
                    'd',
                    d,
                    overwrite = TRUE,
                    temporary = TRUE)
  db %.>%
    ops %.>%
    print(.)
  DBI::dbDisconnect(db)
}




