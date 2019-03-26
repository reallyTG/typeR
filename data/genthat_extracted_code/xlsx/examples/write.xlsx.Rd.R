library(xlsx)


### Name: write.xlsx
### Title: Write a data.frame to an Excel workbook.
### Aliases: write.xlsx write.xlsx2

### ** Examples

## Not run: 
##D 
##D file <- paste(tempdir(), "/usarrests.xlsx", sep="")
##D res <- write.xlsx(USArrests, file)  
##D 
##D # to change the default date format
##D oldOpt <- options()
##D options(xlsx.date.format="dd MMM, yyyy")
##D write.xlsx(x, sheet) # where x is a data.frame with a Date column.
##D options(oldOpt)      # revert back to defaults
##D  
## End(Not run)



