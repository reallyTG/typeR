library(latexpdf)


### Name: ghostconvert
### Title: Call Ghostscript.
### Aliases: ghostconvert

### ** Examples

## Not run: 
##D pdf <- as.pdf(head(Theoph),dir = tempdir())
##D png <- ghostconvert(pdf, gs_cmd = 'mgs')
##D browseURL(png)
## End(Not run)



