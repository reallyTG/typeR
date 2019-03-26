library(Rpoppler)


### Name: PDF_doc
### Title: PDF document reference
### Aliases: PDF_doc

### ** Examples

file <- system.file(file.path("doc", "Sweave.pdf"), package = "utils")
doc <- PDF_doc(file)
## Can now use the reference for information extraction, avoiding
## the creation of new PopplerDocument objects when doing so.
PDF_info(doc)
PDF_fonts(doc)



