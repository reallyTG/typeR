library(bold)


### Name: bold_filter
### Title: Get BOLD specimen + sequence data.
### Aliases: bold_filter

### ** Examples

## Not run: 
##D res <- bold_seqspec(taxon='Osmia')
##D maxx <- bold_filter(res, by = "species_name")
##D minn <- bold_filter(res, by = "species_name", how = "min")
##D 
##D vapply(maxx$nucleotides, nchar, 1, USE.NAMES = FALSE)
##D vapply(minn$nucleotides, nchar, 1, USE.NAMES = FALSE)
## End(Not run)



