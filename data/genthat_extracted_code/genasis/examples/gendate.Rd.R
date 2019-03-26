library(genasis)


### Name: gendate
### Title: Compile the date of measurement
### Aliases: gendate
### Keywords: gendate

### ** Examples

## Single dates:
gendate(Sys.Date())
gendate("10.6.1993")
gendate("1856")

## Date vectors:
gendate(c("2000-05-30","2001","4.4.98","2003-06-01 12:30:45"))
gendate(c(as.POSIXlt("2003-06-01 12:30:45"),"2003-07-02"))



