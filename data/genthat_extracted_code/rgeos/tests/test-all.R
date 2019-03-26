library(testthat)
library(rgeos)

set_do_poly_check(FALSE)
#test_dir(system.file("tests", package = "rgeos"), StopReporter)#SummaryByContextReporter)
#test_package("rgeos")
test_check("rgeos")
set_do_poly_check(TRUE)
