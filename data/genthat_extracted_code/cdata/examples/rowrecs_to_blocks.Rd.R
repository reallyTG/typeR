library(cdata)


### Name: rowrecs_to_blocks
### Title: Map a set of columns to rows (takes a 'data.frame').
### Aliases: rowrecs_to_blocks rowrecs_to_blocks.default
###   rowrecs_to_blocks.relop

### ** Examples


  # un-pivot example
  d <- data.frame(AUC = 0.6, R2 = 0.2)
  cT <- build_unpivot_control(nameForNewKeyColumn= 'meas',
                              nameForNewValueColumn= 'val',
                              columnsToTakeFrom= c('AUC', 'R2'))
  rowrecs_to_blocks(d, cT)



d <- data.frame(AUC = 0.6, R2 = 0.2)
cT <- build_unpivot_control(
  nameForNewKeyColumn= 'meas',
  nameForNewValueColumn= 'val',
  columnsToTakeFrom= c('AUC', 'R2'))

ops <- rquery::local_td(d) %.>%
  rowrecs_to_blocks(., cT)
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




