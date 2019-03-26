## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  test_A <- matrix(c(4,1,1,3), ncol = 2)
#  test_b <- matrix(1:2, ncol = 1)
#  
#  cgsolve(test_A, test_b, 1e-6, 1000)

## ---- eval=FALSE---------------------------------------------------------
#  test_A <- matrix(c(4,1,1,3), ncol = 2)
#  test_b <- matrix(1:2, ncol = 1)
#  
#  pcgsolve(test_A, test_b, "ICC")

