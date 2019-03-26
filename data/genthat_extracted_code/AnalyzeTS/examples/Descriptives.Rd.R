library(AnalyzeTS)


### Name: Descriptives
### Title: Descriptives
### Aliases: Descriptives

### ** Examples

#Load data
library(MASS)
data(crabs)

#Calculate descriptive statistic to a continuously variable
Descriptives(crabs$FL)

#Calculate descriptive statistic to continuously variables
Descriptives(crabs)
Descriptives(crabs,answer=2)
Descriptives(crabs,answer=2,r=6)

#To just see some descriptive statistic variables
Descriptives(crabs,statistic=list("Min","Mean","Median","Max"))

#Combined paint graph to compare
Descriptives(crabs,plot=list("Mean","SD"))

#Descriptives for time series
Descriptives(lh,plot=TRUE)



