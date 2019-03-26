library(taxize)


### Name: genbank2uid
### Title: Get NCBI taxonomy UID from GenBankID
### Aliases: genbank2uid

### ** Examples

## Not run: 
##D # with accession numbers
##D genbank2uid(id = 'AJ748748')
##D genbank2uid(id = 'Y13155')
##D genbank2uid(id = 'X78312')
##D genbank2uid(id = 'KM495596')
##D 
##D # with gi numbers
##D genbank2uid(id = 62689767)
##D genbank2uid(id = 22775511)
##D genbank2uid(id = 156446673)
##D 
##D # pass in many accession or gi numbers
##D genbank2uid(c(62689767,156446673))
##D genbank2uid(c('X78312','KM495596'))
##D genbank2uid(list('X78312',156446673))
##D 
##D # curl options
##D res <- genbank2uid(id = 156446673, verbose = TRUE)
## End(Not run)



