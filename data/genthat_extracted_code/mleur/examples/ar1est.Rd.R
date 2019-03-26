library(mleur)


### Name: ar1est
### Title: MLE or LSE for AR(1) parameter.  Sample mean correction used in
###   MLE case. Intercept term estimated in LSE case.
### Aliases: ar1est
### Keywords: ts

### ** Examples

#Example 1
#compare MLE and LSE for vel series
ar1est(vel)
ar1est(vel, method="MLE")
ar1est(vel, method="LSE")
#
#Example 2
ar1est(DiffBA)
ar1est(DiffBA, method="LSE")



