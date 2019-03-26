library(bold)


### Name: bold_seq
### Title: Search BOLD for sequences.
### Aliases: bold_seq

### ** Examples

## Not run: 
##D res <- bold_seq(taxon='Coelioxys')
##D bold_seq(taxon='Aglae')
##D bold_seq(taxon=c('Coelioxys','Osmia'))
##D bold_seq(ids='ACRJP618-11')
##D bold_seq(ids=c('ACRJP618-11','ACRJP619-11'))
##D bold_seq(bin='BOLD:AAA5125')
##D bold_seq(container='ACRJP')
##D bold_seq(researchers='Thibaud Decaens')
##D bold_seq(geo='Ireland')
##D bold_seq(geo=c('Ireland','Denmark'))
##D 
##D # Return the http response object for detailed Curl call response details
##D res <- bold_seq(taxon='Coelioxys', response=TRUE)
##D res$url
##D res$status_code
##D res$response_headers
##D 
##D ## curl debugging
##D ### You can do many things, including get verbose output on the curl 
##D ### call, and set a timeout
##D bold_seq(taxon='Coelioxys', verbose = TRUE)[1:2]
##D # bold_seqspec(taxon='Coelioxys', timeout_ms = 10)
## End(Not run)



