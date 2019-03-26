library(bold)


### Name: bold_seqspec
### Title: Get BOLD specimen + sequence data.
### Aliases: bold_seqspec

### ** Examples

## Not run: 
##D bold_seqspec(taxon='Osmia')
##D bold_seqspec(taxon='Osmia', format='xml')
##D bold_seqspec(taxon='Osmia', response=TRUE)
##D res <- bold_seqspec(taxon='Osmia', sepfasta=TRUE)
##D res$fasta[1:2]
##D res$fasta['GBAH0293-06']
##D 
##D # records that match a marker name
##D res <- bold_seqspec(taxon="Melanogrammus aeglefinus", marker="COI-5P")
##D 
##D # records that match a geographic locality
##D res <- bold_seqspec(taxon="Melanogrammus aeglefinus", geo="Canada")
##D 
##D ## curl debugging
##D ### You can do many things, including get verbose output on the curl call,
##D ### and set a timeout
##D head(bold_seqspec(taxon='Osmia', verbose = TRUE))
##D ## timeout
##D # head(bold_seqspec(taxon='Osmia', timeout_ms = 1))
## End(Not run)



