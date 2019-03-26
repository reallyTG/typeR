library(taxonomizr)


### Name: taxonomizr-package
### Title: taxonomizr: Functions to Work with NCBI Accessions and Taxonomy
### Aliases: taxonomizr taxonomizr-package
### Keywords: internal

### ** Examples

## Not run: 
##D   if(readline(
##D     "This will download a lot data and take a while to process.
##D      Make sure you have space and bandwidth. Type y to continue: "
##D   )!='y')
##D     stop('This is a stop to make sure no one downloads a bunch of data unintentionally')
##D 
##D   prepareDatabase('accessionTaxa.sql')
##D   blastAccessions<-c("Z17430.1","Z17429.1","X62402.1") 
##D   ids<-accessionToTaxa(blastAccessions,'accessionTaxa.sql')
##D   getTaxonomy(ids,'accessionTaxa.sql')
## End(Not run)



