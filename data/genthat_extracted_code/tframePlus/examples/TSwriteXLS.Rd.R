library(tframePlus)


### Name: TSwriteXLS
### Title: Write Time Series to an .xls Spreadsheet File
### Aliases: TSwriteXLS TSwriteCSV
### Keywords: utilities ts

### ** Examples

 tofile <- tempfile()
 
 z <- ts(1:10, start=c(1999,2), freq=12)
 seriesNames(z) <- "ser 1"
 TSwriteXLS(z, FileName=tofile) 

 zz <- tbind(z, diff(z))
 seriesNames(zz) <- c("ser 1", "diff")
 TSwriteXLS(zz, FileName=tofile,  SheetNames="2 series")

 zz <- ts(1:10, start=c(1999,1), freq=1)
 seriesNames(zz) <- "annual ser"
 TSwriteXLS(z, zz, FileName=tofile,  SheetNames=c("monthly", "annual"))

 unlink(tofile) 



