library(rdryad)


### Name: dryad_files
### Title: Get a URL given a Dryad DOI
### Aliases: dryad_files

### ** Examples

## Not run: 
##D dryad_files(doi = '10.5061/dryad.1758')
##D dryad_files(doi = '10.5061/dryad.60699')
##D 
##D # if you have a handle, use handle2doi() to convert to a DOI
##D (doi <- handle2doi('10255/dryad.153920'))
##D (files <- dryad_files(doi))
##D (out <- dryad_fetch(files))
##D # file sizes in MB
##D vapply(out, function(x) file.info(x)[["size"]], 1) / 10^6
## End(Not run)



