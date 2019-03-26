library(rdryad)


### Name: dryad_metadata
### Title: Download Dryad file metadata
### Aliases: dryad_metadata

### ** Examples

## Not run: 
##D dryad_metadata('10.5061/dryad.1758')
##D dryad_metadata('10.5061/dryad.9t0n8/1')
##D dryad_metadata('10.5061/dryad.60699/3')
##D out <- dryad_metadata('10.5061/dryad.60699/5')
##D out$desc$text[out$desc$qualifier %in% c("pageviews", "downloads")]
## End(Not run)



