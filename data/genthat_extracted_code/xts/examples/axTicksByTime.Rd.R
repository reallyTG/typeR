library(xts)


### Name: axTicksByTime
### Title: Compute x-Axis Tickmark Locations by Time
### Aliases: axTicksByTime
### Keywords: utilities

### ** Examples

data(sample_matrix)
axTicksByTime(as.xts(sample_matrix),'auto')
axTicksByTime(as.xts(sample_matrix),'weeks')
axTicksByTime(as.xts(sample_matrix),'months',7)



