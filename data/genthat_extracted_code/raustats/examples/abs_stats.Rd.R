library(raustats)


### Name: abs_stats
### Title: Download data from the ABS API
### Aliases: abs_stats

### ** Examples

  ## No test: 
    x <- abs_stats(dataset="CPI", filter="all", return_url=TRUE);
    x <- abs_stats(dataset="CPI", filter=list(MEASURE=1, REGION=c(1:8,50),
                                              INDEX=10001, TSEST=10, FREQUENCY="Q"));
    x <- abs_stats(dataset="CPI", filter=list(MEASURE="all", REGION=50,
                                              INDEX=10001, TSEST=10, FREQUENCY="Q"));
    x <- abs_stats(dataset="CPI", filter=list(MEASURE="all", REGION=50, INDEX=10001,
                                              TSEST=10, FREQUENCY="Q"), return_url=TRUE);
 
## End(No test)



