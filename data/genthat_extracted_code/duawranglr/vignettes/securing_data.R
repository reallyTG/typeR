## ----setup, include = FALSE-------------------------------------------------------------
options(width = 90)
knitr::opts_chunk$set(collapse = TRUE, comment = NA)

## ---- eval = FALSE----------------------------------------------------------------------
#  library(tidyverse)
#  library(duawranglr)
#  
#  ## get crosswalk and admin data files
#  dua_cw_file <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
#  admin_file <- system.file('extdata', 'admin_data.csv', package = 'duawranglr')
#  
#  ## set the DUA crosswalk
#  set_dua_cw(dua_cw_file)

## ---- echo = FALSE----------------------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(readr))
library(duawranglr)
dua_cw_file <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
admin_file <- system.file('extdata', 'admin_data.csv', package = 'duawranglr')
set_dua_cw(dua_cw_file)

## ---------------------------------------------------------------------------------------
## compare level II and III restrictions
see_dua_options(level = c('level_ii', 'level_iii'))

## ---------------------------------------------------------------------------------------
## check all level restrictions
see_dua_options()

## ---------------------------------------------------------------------------------------
## set DUA level
set_dua_level('level_ii', deidentify_required = TRUE, id_column = 'sid')

## ---------------------------------------------------------------------------------------
## see set DUA level 
see_dua_level(show_restrictions = TRUE)

## ---- eval = FALSE----------------------------------------------------------------------
#  ## read in raw administrative data
#  df <- read_dua_file(admin_file)
#  df

## ---- echo = FALSE----------------------------------------------------------------------
## read in raw administrative data
df <- readr::read_csv(admin_file,
                      col_types = cols(sid = col_character(),
                                       sname = col_character(),
                                       dob = col_character(),
                                       gender = col_integer(),
                                       raceeth = col_integer(),
                                       tid = col_integer(),
                                       tname = col_character(),
                                       zip = col_integer(),
                                       mathscr = col_integer(),
                                       readscr = col_integer()
                                       )
                      )
df

## ---- echo = FALSE----------------------------------------------------------------------
dff <- df

## ---- echo = FALSE----------------------------------------------------------------------
## deidentify data
tmpdir <- tempdir()
df <- deid_dua(df, write_crosswalk = TRUE, id_length = 20,
               crosswalk_filename = file.path(tmpdir, 'tmp.csv'))

## ---- eval = FALSE----------------------------------------------------------------------
#  ## deidentify data
#  df <- deid_dua(df, write_crosswalk = TRUE, id_length = 20)

## ---- echo = FALSE----------------------------------------------------------------------
## show crosswalk
cw <- readr::read_csv(file.path(tmpdir, 'tmp.csv'),
                      col_types = cols(.default = 'c'))
cw
rm(tmpdir)

## ---------------------------------------------------------------------------------------
## show data frame
df

## ---- echo = FALSE----------------------------------------------------------------------
df <- dff

## ---- echo = FALSE----------------------------------------------------------------------
tmpdir <- tempdir()
cw2 <- readr::read_csv('../tests/testthat/testdata/crosswalk_full.csv',
                       col_types = cols(.default = 'c'))
readr::write_csv(cw2, file.path(tmpdir, 'crosswalk_full.csv'))
cw2

## ---- echo = FALSE----------------------------------------------------------------------
df <- deid_dua(df, existing_crosswalk = file.path(tmpdir, 'crosswalk_full.csv'))
rm(tmpdir)

## ---------------------------------------------------------------------------------------
df

## ---- echo = FALSE----------------------------------------------------------------------
df <- dff

## ---- echo = FALSE----------------------------------------------------------------------
tmpdir <- tempdir()
cw3 <- readr::read_csv('../tests/testthat/testdata/crosswalk_partial.csv',
                       col_types = cols(.default = 'c'))
readr::write_csv(cw3, file.path(tmpdir, 'crosswalk_partial.csv'))
cw3

## ---- echo = FALSE----------------------------------------------------------------------
df <- deid_dua(df, existing_crosswalk = file.path(tmpdir, 'crosswalk_partial.csv'))


## ---------------------------------------------------------------------------------------
df

## ---- echo = FALSE----------------------------------------------------------------------
cw4 <- readr::read_csv(file.path(tmpdir, 'crosswalk_partial.csv'),
                       col_types = cols(.default = 'c'))
rm(tmpdir)
cw4

## ---------------------------------------------------------------------------------------
## write data to disk with one last check
write_dua_df(df, 'cleaned_data.csv', output_type = 'csv')

## ---------------------------------------------------------------------------------------
## check
check_dua_restrictions(df)

## ---------------------------------------------------------------------------------------
## remove restricted columns
df <- df %>% select(-c(sname, dob, tname, zip))

## check again
check_dua_restrictions(df)

## ---------------------------------------------------------------------------------------
df

## ---- eval = FALSE----------------------------------------------------------------------
#  ## write data to disk
#  write_dua_df(df, 'cleaned_data_lev_ii.csv', output_type = 'csv')

## ---- eval = FALSE----------------------------------------------------------------------
#  ## save template to disk
#  make_dua_template('clean_data.R')

## ---- echo = FALSE----------------------------------------------------------------------
file <- file.path(tempdir(), 'clean_data.R')
make_dua_template(file, answer_list = list('N','','N','',''))
writeLines(readLines(file))

