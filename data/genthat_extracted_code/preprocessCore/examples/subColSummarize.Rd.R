library(preprocessCore)


### Name: subColSummarize
### Title: Summarize columns when divided into groups of rows
### Aliases: subColSummarizeAvg subColSummarizeAvgLog
###   subColSummarizeBiweight subColSummarizeBiweightLog
###   subColSummarizeLogAvg subColSummarizeLogMedian subColSummarizeMedian
###   subColSummarizeMedianLog subColSummarizeMedianpolish
###   subColSummarizeMedianpolishLog convert.group.labels
### Keywords: univar

### ** Examples

### Assign the first 10 rows to one group and
### the second 10 rows to the second group
###
y <- matrix(c(10+rnorm(50),20+rnorm(50)),20,5,byrow=TRUE)

subColSummarizeAvgLog(y,c(rep(1,10),rep(2,10)))
subColSummarizeLogAvg(y,c(rep(1,10),rep(2,10)))
subColSummarizeAvg(y,c(rep(1,10),rep(2,10)))

subColSummarizeBiweight(y,c(rep(1,10),rep(2,10)))
subColSummarizeBiweightLog(y,c(rep(1,10),rep(2,10)))

subColSummarizeMedianLog(y,c(rep(1,10),rep(2,10)))
subColSummarizeLogMedian(y,c(rep(1,10),rep(2,10)))
subColSummarizeMedian(y,c(rep(1,10),rep(2,10)))



subColSummarizeMedianpolishLog(y,c(rep(1,10),rep(2,10)))
subColSummarizeMedianpolish(y,c(rep(1,10),rep(2,10)))







