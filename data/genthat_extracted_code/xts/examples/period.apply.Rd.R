library(xts)


### Name: period.apply
### Title: Apply Function Over Specified Interval
### Aliases: period.apply
### Keywords: utilities

### ** Examples

zoo.data <- zoo(rnorm(31)+10,as.Date(13514:13744,origin="1970-01-01"))
ep <- endpoints(zoo.data,'weeks')
period.apply(zoo.data, INDEX=ep, FUN=function(x) mean(x))
period.apply(zoo.data, INDEX=ep, FUN=mean)                  #same

glue <- function(x) { paste(x,collapse='') }
period.apply(letters,c(0,5,7,26),glue)



