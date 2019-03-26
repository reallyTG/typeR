## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("cboettig/arkdb")

## ----message = FALSE-----------------------------------------------------
library(arkdb)

# additional libraries just for this demo
library(dbplyr)
library(dplyr)
library(nycflights13)
library(fs)

## ----example-------------------------------------------------------------
tmp <- tempdir() # Or can be your working directory, "."
db <- dbplyr::nycflights13_sqlite(tmp)

## ------------------------------------------------------------------------
dir <- fs::dir_create(fs::path(tmp, "nycflights"))
ark(db, dir, lines = 50000)



## ------------------------------------------------------------------------
fs::dir_info(dir) %>% 
  select(path, size) %>%
  mutate(path = fs::path_file(path))

fs::file_info(fs::path(tmp,"nycflights13.sqlite")) %>% 
  pull(size)



## ------------------------------------------------------------------------
files <- fs::dir_ls(dir, glob = "*.tsv.bz2")
new_db <- src_sqlite(fs::path(tmp, "local.sqlite"), create=TRUE)


## ------------------------------------------------------------------------
unark(files, new_db, lines = 50000)  

## ------------------------------------------------------------------------
tbl(new_db, "flights")

## ------------------------------------------------------------------------
# Remove example files we created.
DBI::dbDisconnect(new_db$con)
unlink(dir, TRUE)
unlink(fs::path(tmp, "local.sqlite"))

## ------------------------------------------------------------------------
dir <- fs::dir_create(fs::path(tmp, "nycflights"))

ark(db, dir, 
    streamable_table = streamable_base_csv())

## ------------------------------------------------------------------------
files <- fs::dir_ls(dir, glob = "*.csv.bz2")
new_db <- src_sqlite(fs::path(tmp,"local.sqlite"), create=TRUE)

unark(files, new_db,
      streamable_table = streamable_base_csv())

## ------------------------------------------------------------------------
stream <- 
   streamable_table(
     function(file, ...) readr::read_tsv(file, ...),
     function(x, path, omit_header)
       readr::write_tsv(x = x, path = path, append = omit_header),
     "tsv")


## ------------------------------------------------------------------------
ark(db, dir, 
    streamable_table = stream)

## ----include=FALSE-------------------------------------------------------
DBI::dbDisconnect(db$con)
DBI::dbDisconnect(new_db$con)
unlink(dir, TRUE)

