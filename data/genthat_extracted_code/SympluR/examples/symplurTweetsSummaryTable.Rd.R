library(SympluR)


### Name: symplurTweetsSummaryTable
### Title: Symplur API - Tweets/Summary Table
### Aliases: symplurTweetsSummaryTable
### Keywords: summary table tweets

### ** Examples

require(readr)
datasets <- read_csv(system.file("extdata", "datasets.csv", package = "SympluR", mustWork = TRUE))
LCSMDemoDataTweetsSummaryTable <- symplurTweetsSummaryTable(datasets)



