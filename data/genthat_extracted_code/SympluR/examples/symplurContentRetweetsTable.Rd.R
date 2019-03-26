library(SympluR)


### Name: symplurContentRetweetsTable
### Title: Symplur API - Content/Retweets Table
### Aliases: symplurContentRetweetsTable
### Keywords: content retweets table

### ** Examples

require(readr)
datasets <- read_csv(system.file("extdata", "datasets.csv", package = "SympluR", mustWork = TRUE))
LCSMDemoDataContentRetweetsTable <- symplurContentRetweetsTable(datasets)



