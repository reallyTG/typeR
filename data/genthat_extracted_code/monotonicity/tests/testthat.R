## load dependencies
library(testthat)
library(monotonicity)

## test package separated with filter due to limited Travis-CI build time
test_check('monotonicity', filter = "monoBonferroni")
test_check('monotonicity', filter = "monoRelation")
test_check('monotonicity', filter = "monoSummary")
test_check('monotonicity', filter = "monoUpDown")
test_check('monotonicity', filter = "specify_decimal")
test_check('monotonicity', filter = "wolak")
