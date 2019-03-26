library(gnumeric)


### Name: read.gnumeric.sheets
### Title: Read each sheet from a gnumeric spreadsheet file
### Aliases: read.gnumeric.sheets
### Keywords: IO file

### ** Examples

## Read all sheets from 'file.gnumeric'
## Not run: 
##D df.list <- read.gnumeric.sheets( file="file.gnumeric" );
##D 
##D df1 <- df.list['Sheet1'];
##D 
##D df.list <- read.gnumeric.sheets( file="file.gnumeric",
##D                                  head=TRUE );
##D 
##D names(df.list); ## sheet names
## End(Not run)




