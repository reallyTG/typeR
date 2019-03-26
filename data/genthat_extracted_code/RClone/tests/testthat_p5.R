#testing Randy Zwitch solution

library(testthat)
library(RClone)
test_check("RClone", filter = "p5")
print("unit tests p5 are ok !")
