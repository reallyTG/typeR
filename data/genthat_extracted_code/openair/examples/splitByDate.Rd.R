library(openair)


### Name: splitByDate
### Title: Divide up a data frame by time
### Aliases: splitByDate
### Keywords: methods

### ** Examples


## split data up into "before" and "after"
mydata <- splitByDate(mydata, dates = "1/04/2000",
labels = c("before", "after"))

## split data into 3 partitions:
mydata <- splitByDate(mydata, dates = c("1/1/2000", "1/3/2003"),
labels = c("before", "during", "after"))





