#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p2")
print("unit tests p2 ok !")
