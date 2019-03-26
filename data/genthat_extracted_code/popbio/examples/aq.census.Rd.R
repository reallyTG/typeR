library(popbio)


### Name: aq.census
### Title: Annual census data for Aquilegia in the southwestern US
### Aliases: aq.census
### Keywords: datasets

### ** Examples

data(aq.census)
sv<-table(aq.census$status, aq.census$year)
sv
stage.vector.plot(sv[-1,], prop=FALSE)



