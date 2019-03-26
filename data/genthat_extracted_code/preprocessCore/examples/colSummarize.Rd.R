library(preprocessCore)


### Name: colSumamrize
### Title: Summarize the column of matrices
### Aliases: colSummarizeAvg colSummarizeAvgLog colSummarizeBiweight
###   colSummarizeBiweightLog colSummarizeLogAvg colSummarizeLogMedian
###   colSummarizeMedian colSummarizeMedianLog colSummarizeMedianpolish
###   colSummarizeMedianpolishLog
### Keywords: univar

### ** Examples

y <- matrix(10+rnorm(100),20,5)

colSummarizeAvg(y)
colSummarizeAvgLog(y)
colSummarizeBiweight(y)
colSummarizeBiweightLog(y)
colSummarizeLogAvg(y)
colSummarizeLogMedian(y)
colSummarizeMedian(y)
colSummarizeMedianLog(y)
colSummarizeMedianpolish(y)
colSummarizeMedianpolishLog(y)



