library(rmarkdown)


### Name: pdf_document
### Title: Convert to a PDF/LaTeX document
### Aliases: pdf_document latex_document latex_fragment

### ** Examples

## Not run: 
##D library(rmarkdown)
##D 
##D # simple invocation
##D render("input.Rmd", pdf_document())
##D 
##D # specify an option for latex engine
##D render("input.Rmd", pdf_document(latex_engine = "lualatex"))
##D 
##D # add a table of contents and pass an option to pandoc
##D render("input.Rmd", pdf_document(toc = TRUE, "--listings"))
## End(Not run)



