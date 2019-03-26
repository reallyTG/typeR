library(rquery)


### Name: rq_coltypes
### Title: Get column types by example values as a data.frame.
### Aliases: rq_coltypes

### ** Examples


if(requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  # getDBOption(db, "check_logical_column_types", FALSE)
  # options(rq_connection_tests(db))
  # getDBOption(db, "check_logical_column_types", FALSE)

  d <- data.frame(w= c(NA, 1L),
                  x= c(NA, 2.0),
                  y= factor(c(NA, "x")),
                  z= c(NA, "y"),
                  want = c(1, 0),
                  stringsAsFactors=FALSE)
  d <- rq_copy_to(db, "d", d,
                   overwrite = TRUE,
                   temporary = TRUE)
  res <- d %.>%
    extend(.,
               wc %:=% ifelse(w>1, "x", "y"),
               wn %:=% ifelse(w>1, 1, 2),
               xc %:=% ifelse(x>1, "x", "y"),
               xn %:=% ifelse(x>1, 1, 2),
               yc %:=% ifelse(y=="a", "x", "y"),
               yn %:=% ifelse(y=="a", "x", "y")) %.>%
    materialize(db, .)
  resn <- DBI::dbQuoteIdentifier(db, res$table_name)
  print("full table types")
  print(str(DBI::dbGetQuery(db, paste("SELECT * FROM", resn))))
  print("single row mis-reported types")
  print(str(DBI::dbGetQuery(db, paste("SELECT * FROM", resn, "WHERE want=1"))))
  print("rq_coltypes correct synthetic example row types")
  print(str(rq_coltypes(db, res$table_name, force_check = TRUE)))
  DBI::dbDisconnect(db)
}




