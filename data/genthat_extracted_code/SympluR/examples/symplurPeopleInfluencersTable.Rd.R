library(SympluR)


### Name: symplurPeopleInfluencersTable
### Title: Symplur API - People/Influencers Table
### Aliases: symplurPeopleInfluencersTable
### Keywords: influencers people table

### ** Examples

require(readr)
datasets <- read_csv(system.file("extdata", "datasets.csv", package = "SympluR", mustWork = TRUE))
LCSMDemoDataPeopleInfluencersTable <- symplurPeopleInfluencersTable(datasets)



