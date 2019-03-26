library(cdata)


### Name: build_pivot_control
### Title: Build a blocks_to_rowrecs()/rowrecs_to_blocks() control table
###   that specifies a pivot from a 'data.frame'.
### Aliases: build_pivot_control build_pivot_control.default
###   build_pivot_control.relop

### ** Examples


  d <- data.frame(measType = c("wt", "ht"),
                  measValue = c(150, 6),
                  stringsAsFactors = FALSE)
  build_pivot_control(d,
                      'measType', 'measValue',
                      sep = '_')


d <- data.frame(measType = c("wt", "ht"),
                measValue = c(150, 6),
                stringsAsFactors = FALSE)

ops <- rquery::local_td(d) %.>%
  build_pivot_control(.,
                      'measType', 'measValue',
                      sep = '_')
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




