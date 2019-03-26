## ---- include = FALSE-----------------------------------------------------------------------------
library(xpose)
options(width = 100)

xpdb <- xpdb_ex_pk

knitr::opts_chunk$set(out.width = '75%',
                      comment   = '',
                      message   = FALSE)

## ----demo print xpose_data------------------------------------------------------------------------
xpdb # or print(xpdb)

## ----demo get_code--------------------------------------------------------------------------------
code <- get_code(xpdb)
code

## ----demo get_data--------------------------------------------------------------------------------
data <- get_data(xpdb, table = 'cotab001')
data

## ----demo get_file--------------------------------------------------------------------------------
file <- get_file(xpdb, file = 'run001.ext')
file

## ----demo get_prm---------------------------------------------------------------------------------
# Raw output for editing
prm <- get_prm(xpdb, digits = 4)
prm

# Nicely formated table
prm_table(xpdb, digits = 4)

## ----demo get_summary-----------------------------------------------------------------------------
run_sum <- get_summary(xpdb, .problem = 0)
run_sum

