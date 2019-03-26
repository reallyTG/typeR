library(ukgasapi)


### Name: dataItemExplorer
### Title: Data Item Explorer API
### Aliases: dataItemExplorer

### ** Examples

# Specify the data item(s) to enquire from API
dataitems <- c("Storage Injection, Actual",
               "Storage Withdrawal, Actual")

# Initialise API (requires internet connection for this step)
response <- dataItemExplorer(dataitems,
                             fromdate = "2013-10-01",
                             todate="2015-09-30")

# Visualise the results on a chart
library(ggplot2)
ggplot(response,aes(x=ApplicableFor,y=Value,colour=PublicationObjectName)) + geom_line()



