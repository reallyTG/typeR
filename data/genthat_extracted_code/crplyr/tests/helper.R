Sys.setlocale("LC_COLLATE", "C") ## What CRAN does; affects sort order
set.seed(999) ## To ensure that tests that involve randomness are reproducible

"%>%" <- magrittr::`%>%`

## Load the crunch package test setup
source(system.file("crunch-test.R", package="crunch"))
