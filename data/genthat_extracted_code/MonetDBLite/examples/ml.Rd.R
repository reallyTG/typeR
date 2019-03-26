library(MonetDBLite)


### Name: ml
### Title: Shorthand connection constructor for embedded MonetDB
### Aliases: ml

### ** Examples

  library(DBI)
  dbdir <- file.path( tempdir() , "ml" )
  con <- ml(dbdir)
  dbDisconnect(con, shutdown = TRUE)



