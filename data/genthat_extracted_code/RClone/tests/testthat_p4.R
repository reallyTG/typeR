#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p4")
print("unit tests p4 are ok !")
