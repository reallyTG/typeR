library(dataMaid)


### Name: check
### Title: Perform checks of potential errors in variable/dataset
### Aliases: check
### Keywords: misc

### ** Examples


x <- 1:5
check(x)

#Annoyingly coded missing as 99
y <- c(rnorm(100), rep(99, 10))
check(y)

#Check y for outliers and print 4 decimals for problematic variables
check(y, checks = setChecks(numeric = "identifyOutliers"), maxDecimals = 4)

#Change what checks are performed on a variable, now only identifyMissing is called
# for numeric variables
check(y, checks = setChecks(numeric = "identifyMissing"))

#Check a full data.frame at once
data(cars)
check(cars)

#Check a full data.frame at once, while changing the standard settings for
#several data classes at once. Here, we ommit the check of miscoded missing values for factors
#and we only do this check for numeric variables:
check(cars, checks = setChecks(factor = defaultFactorChecks(remove = "identifyMissing"),
  numeric = "identifyMissing"))




