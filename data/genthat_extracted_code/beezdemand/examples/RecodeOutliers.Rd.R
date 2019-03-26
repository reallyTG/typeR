library(beezdemand)


### Name: RecodeOutliers
### Title: Recode Outliers
### Aliases: RecodeOutliers

### ** Examples

## If any outliers are detected, they would be coded as 1 unit higher
## No test: 
emp <- GetEmpirical(apt)
RecodeOutliers(emp[, c(2:6)], unitshigher = 1)
## End(No test)



