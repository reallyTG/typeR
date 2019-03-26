library(cdata)


### Name: unpivot_to_blocks
### Title: Move values from columns to rows (anti-pivot, or "shred").
### Aliases: unpivot_to_blocks unpivot_to_blocks.default
###   unpivot_to_blocks.relop

### ** Examples


  d <- data.frame(AUC= 0.6, R2= 0.2)
  unpivot_to_blocks(d,
                    nameForNewKeyColumn= 'meas',
                    nameForNewValueColumn= 'val',
                    columnsToTakeFrom= c('AUC', 'R2')) %.>%
     print(.)


d <- data.frame(AUC= 0.6, R2= 0.2)
ops <- rquery::local_td(d) %.>%
  unpivot_to_blocks(
    .,
    nameForNewKeyColumn= 'meas',
    nameForNewValueColumn= 'val',
    columnsToTakeFrom= c('AUC', 'R2'))
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




