library(DataCombine)


### Name: TimeExpand
### Title: Expands a data set so that it includes an observation for each
###   time point in a sequence. Works with grouped data.
### Aliases: TimeExpand

### ** Examples

Data <- data.frame(country = c("Cambodia", "Camnodia", "Japan", "Japan"),
                   year = c(1990, 2001, 1994, 2012))

ExpandedData <- TimeExpand(Data, GroupVar = 'country', TimeVar = 'year')




