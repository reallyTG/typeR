library(SympluR)


### Name: symplurTweetsActivityTable
### Title: Symplur API - Tweets/Activity Table
### Aliases: symplurTweetsActivityTable
### Keywords: activity table tweets

### ** Examples

require(readr)
datasets <- read_csv(system.file("extdata", "datasets.csv", package = "SympluR", mustWork = TRUE))
LCSMDemoDataTweetsActivityTable <- symplurTweetsActivityTable(datasets)



