library(gnumeric)


### Name: read.gnumeric.sheet
### Title: Read data from a gnumeric (or MS Excel, Openoffice Calc, Xbase,
###   Quatro Pro, Paradox, HTML, etc) spreadsheet or database file using
###   ssconvert from the gnumeric distribution
### Aliases: read.gnumeric.sheet read.gnumeric.range
### Keywords: IO file

### ** Examples

## Read all data from 'Sheet1'
## Not run: 
##D df <- read.gnumeric.sheet( file="file.gnumeric" );
##D 
##D df <- read.gnumeric.sheet( file="file.gnumeric",
##D                            sheet.name='Sheet1' );
##D 
##D 
##D 
##D ## Read from Excel sheet named 'Sheet3' the range C3:D50,
##D ## rename columns to 'C' and 'D', rows to '3' ... '50',
##D ## then drop all empty rows.
##D ##
##D df<-read.gnumeric.sheet( "file.xls",
##D                           sheet.name='Sheet3',
##D                           top.left='C3',
##D                           bottom.right='D50',
##D                           drop.empty.rows="all",
##D                           drop.empty.columns="none",
##D                           colnames.as.sheet=TRUE
##D                          )
##D 
##D 
##D ## Read from "file.gnumeric", 'Sheet1' data in 'A1:E100',
##D ## Use first row (of selected range) as column names.
##D ## Drop empty rows and columns from bottom and right.
##D df<-read.gnumeric.sheet("file.gnumeric", head=TRUE,
##D                          bottom.right='E100')
##D 
##D 
##D ## Why does it not work? Set quiet=FALSE to see
##D ## the command executed (and on unix, diagnostic
##D ## messages from ssconvert).
##D df<-read.gnumeric.sheet( "file.ods", quiet=FALSE )
## End(Not run)




