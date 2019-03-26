library(disto)


### Name: as.data.frame.disto
### Title: Convert a disto object to dataframe
### Aliases: as.data.frame.disto

### ** Examples

temp <- stats::dist(iris[,1:4])
dio  <- disto(objectname = "temp")
dio
head(as.data.frame(dio))



