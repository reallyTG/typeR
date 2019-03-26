library(cdata)


### Name: build_pivot_control_q
### Title: Build a blocks_to_rowrecs_q() control table that specifies a
###   pivot (query based, takes name of table).
### Aliases: build_pivot_control_q

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  d <- data.frame(measType = c("wt", "ht"),
                  measValue = c(150, 6),
                  stringsAsFactors = FALSE)
  DBI::dbWriteTable(my_db,
                    'd',
                    d,
                    overwrite = TRUE,
                    temporary = TRUE)
  build_pivot_control_q('d', 'measType', 'measValue',
                        my_db = my_db,
                        sep = '_') %.>%
     print(.)
  DBI::dbDisconnect(my_db)
}




