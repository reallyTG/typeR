#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p3")
print("unit tests p3 are ok !")
