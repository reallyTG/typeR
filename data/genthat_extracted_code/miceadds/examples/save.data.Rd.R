library(miceadds)


### Name: save.data
### Title: R Utilities: Saving/Writing Data Files using 'miceadds'
### Aliases: save.data
### Keywords: R utilities

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Save dataset data.ma01
##D #############################################################################
##D 
##D #*** use data.ma01 as an example for writing data files using save.data
##D data(data.ma01)
##D dat <- data.ma01
##D 
##D # set a working directory
##D pf2 <- "P:/ARb/temp_miceadds"
##D 
##D # save data in Rdata format
##D miceadds::save.data( dat, filename="ma01data", type="Rdata", path=pf2)
##D 
##D # save data in table format without row and column names
##D miceadds::save.data( dat, filename="ma01data", type="table", path=pf2,
##D             row.names=FALSE, na=".", col.names=FALSE)
##D 
##D # save data in csv2 format, including time stamp in file name
##D # and row index and time stamp in saved data
##D miceadds::save.data( dat, filename="ma01data", type="csv2", path=pf2,
##D             row.names=FALSE, na="", suffix=systime()[5],
##D             index=TRUE, systime=TRUE )
##D 
##D # save data in sav format
##D miceadds::save.data( dat, filename="ma02data", type="sav",  path=pf2 )
##D 
##D # save data file in different formats
##D types <- c("Rdata", "csv2", "sav")
##D sapply( types, FUN=function(type){
##D     miceadds::save.data( dat, filename="ma02data", type=type,  path=pf2,
##D                suffix=miceadds::systime()[3], row.names=TRUE  )
##D                                     } )
##D 
##D # save data frame in multiple file formats (sav, table and csv2)
##D miceadds::save.data( dat, filename="ma03data", type=c("sav","table","csv2"),  path=pf2,
##D             suffix=miceadds::systime()[7]  )
## End(Not run)



