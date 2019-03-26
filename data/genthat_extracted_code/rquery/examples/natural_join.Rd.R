library(rquery)


### Name: natural_join
### Title: Make a natural_join node.
### Aliases: natural_join

### ** Examples


if(requireNamespace("DBI", quietly = TRUE) &&
   requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(),
                          ":memory:")

  d1 <- rq_copy_to(
    my_db, 'd1',
    build_frame(
      "key", "val", "val1" |
        "a"  , 1  ,  10    |
        "b"  , 2  ,  11    |
        "c"  , 3  ,  12    ))
  d2 <- rq_copy_to(
    my_db, 'd2',
    build_frame(
      "key", "val", "val2" |
        "a"  , 5  ,  13    |
        "b"  , 6  ,  14    |
        "d"  , 7  ,  15    ))

  # key matching join
  optree <- natural_join(d1, d2,
                         jointype = "LEFT", by = 'key')
  execute(my_db, optree) %.>%
    print(.)

  # full cross-product join
  # (usually with jointype = "FULL", but "LEFT" is more
  # compatible with rquery field merg semantics).
  optree2 <- natural_join(d1, d2,
                          jointype = "LEFT", by = NULL)
  execute(my_db, optree2) %.>%
    print(.)
  # notice ALL non-"by" fields take coalese to left table.

  DBI::dbDisconnect(my_db)
}




