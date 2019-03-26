library(DescTools)


### Name: XLGetRange
### Title: Import Data Directly From Excel
### Aliases: XLGetRange XLGetWorkbook XLCurrReg
### Keywords: manip

### ** Examples

## Not run: 
##D  # Windows-specific example
##D 
##D XLGetRange(file="C:\My Documents\data.xls",
##D            sheet="Sheet1",
##D            range=c("A2:B5","M6:X23","C4:D40"))
##D 
##D 
##D # if the current region has to be read (incl. a header), place the cursor in the interesting region
##D # and run:
##D d.set <- XLGetRange(header=TRUE)
## End(Not run)



