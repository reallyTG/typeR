library(discharge)


### Name: allstats
### Title: Calculate all characteristic stats for a site
### Aliases: allstats

### ** Examples

# allstats function works on files
# read R data into temporary file handle
data(sycamore)
f = tempfile(fileext="txt")
write.table(sycamore, file=f, sep="\t")

# print all statistics for this river
allstats(f,river.name="sycamore", date.col = 2, discharge.col = 3, skipped.rows = 1)




