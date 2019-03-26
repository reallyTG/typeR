if (!requireNamespace("testthat", quietly=TRUE)) install.packages("testthat", dependencies=TRUE, repos="http://cran.rstudio.com/")
library(nbc4va)

testthat::test_check("nbc4va")
