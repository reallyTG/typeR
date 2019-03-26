library(timeSeries)


### Name: orderColnames
### Title: Reorder Column Names of a Time Series
### Aliases: orderColnames sortColnames sampleColnames statsColnames
###   pcaColnames hclustColnames
### Keywords: chron

### ** Examples

## Load Swiss Pension Fund Benchmark Data -
   data <- LPP2005REC[,1:6]
   
## Abbreviate Column Names -
   colnames(data)

## Sort Alphabetically - 
   sortColnames(data)
  
## Sort by Column Names by Hierarchical Clustering -
   hclustColnames(data)
   head(data[, hclustColnames(data)])



