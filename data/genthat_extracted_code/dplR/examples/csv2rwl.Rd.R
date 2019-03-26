library(dplR)


### Name: csv2rwl
### Title: Read Ring Width File from CSV
### Aliases: csv2rwl
### Keywords: IO

### ** Examples

library(utils)
data(ca533)
# write out a rwl file in a format that csv2rwl will understand
tm <- time(ca533)
foo <- data.frame(tm,ca533)
# this is the temp file where foo will be written
tmpName <- tempfile()
write.csv(foo,file=tmpName,row.names=FALSE)
# read it back in using csv2rwl
bar <- csv2rwl(tmpName)
# check to see if identical
identical(ca533,bar)
# delete temp file
unlink(tmpName)



