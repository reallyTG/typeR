library(discharge)


### Name: parameters.list
### Title: Calculate all characteristic stats from a list of files
### Aliases: parameters.list
### Keywords: datasets

### ** Examples

# this function works on list of files
# read R data into temporary file handle
data(sycamore)
f = tempfile(fileext="txt")
write.table(sycamore, file=f, sep="\t")

# print all statistics for the list of rivers
parameters.list(c(f), names=c("sycamore"), date.col=2,dis.col=3,skipped.rows = 1)




