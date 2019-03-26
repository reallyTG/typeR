library(RSDA)


### Name: SDS.to.RSDA
### Title: SDS SODAS files to RSDA files.
### Aliases: SDS.to.RSDA
### Keywords: Symbolic data table

### ** Examples

## Not run: 
##D # We can read the file directly from the SODAS SDA file as follows:
##D # We can save the file in CSV to RSDA format as follows:
##D setwd('C:/Program Files (x86)/DECISIA/SODAS version 2.0/bases/')
##D result <- SDS.to.RSDA(file.path='hani3101.sds')
##D # We can save the file in CSV to RSDA format as follows:
##D write.sym.table(result, file='hani3101.csv', sep=';',dec='.', row.names=TRUE,
## End(Not run)



