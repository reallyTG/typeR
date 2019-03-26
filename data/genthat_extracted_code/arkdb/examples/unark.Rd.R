library(arkdb)


### Name: unark
### Title: Unarchive a list of compressed tsv files into a database
### Aliases: unark

### ** Examples

## No test: 
## Setup: create an archive.
library(dplyr)
dir <- tempdir() 
db <- dbplyr::nycflights13_sqlite(tempdir())

## database -> .tsv.bz2 
ark(db, dir)

## list all files in archive (full paths)
files <- list.files(dir, "[.]tsv\\.bz2$", full.names = TRUE)

## Read archived files into a new database (another sqlite in this case)
new_db <- src_sqlite(file.path(dir, "local.sqlite"), create=TRUE)
unark(files, new_db)

## Prove table is returned successfully.
tbl(new_db, "flights")

## End(No test)



