library(s20x)


### Name: summaryStats
### Title: Summary Statistics
### Aliases: summaryStats summaryStats.default summaryStats.formula
###   summaryStats.matrix
### Keywords: multivariate

### ** Examples


## STATS20x data:
data(course.df)

## Single variable summary
with(course.df, summaryStats(Exam))

## Using a formula
summaryStats(Exam ~ Stage1, course.df)

## Using a matrix
X = cbind(rnorm(50), rnorm(50))
summaryStats(X)

## Saving and extracting the information
sumStats = summaryStats(Exam ~ Degree, course.df)
sumStats

## Just the BAs
sumStats['BA', ]

## Just the means
sumStats$mean




