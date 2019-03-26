library(stationery)


### Name: crmda_html_document
### Title: Custom output_format object to make MathJax work with custom
###   HTML template
### Aliases: crmda_html_document

### ** Examples

tdir <- tempdir()
doctype <- "rmd2html-guide"
dirout <- initWriteup(doctype, dir = file.path(tdir, doctype))
list.files(dirout)
MESSG <- paste("Inspect the YAML header output section of 'skeleton.Rmd'.",
               "It makes use of 'crmda_html_document'.")
cat(MESSG)



