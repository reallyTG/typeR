library(rdryad)


### Name: dryad_fetch
### Title: Download Dryad files
### Aliases: dryad_fetch

### ** Examples

## Not run: 
##D # Single file
##D x <- dryad_files('10.5061/dryad.1758')
##D 
##D ## without specifying a destination file
##D dryad_fetch(url = x)
##D 
##D ## specify a destination file
##D dryad_fetch(url = x[1], (f <- tempfile(fileext = ".csv")))
##D 
##D ## use try_file_names - we try to extract file names from URLs
##D dryad_fetch(url = x, try_file_names = TRUE)
##D 
##D # Many files
##D x <- dryad_files(doi = '10.5061/dryad.60699')
##D res <- dryad_fetch(x)
##D head(read.delim(res[[1]], sep = ";"))
## End(Not run)



