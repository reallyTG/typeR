library(SympluR)


### Name: symplurContentWordsTable
### Title: Symplur API - Content/Words Table
### Aliases: symplurContentWordsTable
### Keywords: content table words

### ** Examples

require(readr)
datasets <- read_csv(system.file("extdata", "datasets.csv", package = "SympluR", mustWork = TRUE))
LCSMDemoDataContentWordsTable <- symplurContentWordsTable(datasets)



