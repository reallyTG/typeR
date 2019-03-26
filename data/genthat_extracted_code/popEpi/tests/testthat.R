library("testthat")
library("popEpi")
library("data.table")

using_r_devel <- grepl(pattern = "devel", x = R.version$status)
if (using_r_devel) {
  ## memory leak problem in data.table 1.11.2 in R-devel (3.6.0 atm)
  requireNamespace("data.table")
  data.table::setDTthreads(threads = 1L)
}

test_check("popEpi")

