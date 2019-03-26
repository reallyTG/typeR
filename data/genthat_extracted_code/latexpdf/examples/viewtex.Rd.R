library(latexpdf)


### Name: viewtex
### Title: Render and View TEX Files
### Aliases: viewtex

### ** Examples

file <- file.path(tempdir(),'test.tex')
writeLines(as.ltable(head(Theoph)), file)
## Not run: 
##D viewtex(file)
##D viewtex(file, png = TRUE, gs_cmd = 'mgs')
## End(Not run)



