library(DVHmetrics)


### Name: saveMetric
### Title: Save DVH metrics to file
### Aliases: saveMetric saveMetric.data.frame saveMetric.list

### ** Examples

res <- getMetric(dataMZ, c("D1CC", "V10%_CC"),
                 sortBy=c("metric", "structure"),
                 splitBy="patID")
## Not run: 
##D # not run
##D saveMetric(res, file="metricsResults.txt", sep="\t")
## End(Not run)



