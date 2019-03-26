library(twoway)


### Name: to_long
### Title: Reshape a data.frame or matrix to a long data.frame
### Aliases: to_long to_wide

### ** Examples

Arizona.long <- to_long(Arizona, varNames=c("Month", "City"))
Arizona.long

Arizona.long <- to_long(Arizona, varNames=c("Month", "City"))
# back the other way
to_wide(Arizona.long)



