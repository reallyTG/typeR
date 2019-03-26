library(TeXCheckR)


### Name: validate_bibliography
### Title: Validate bibliography according to Grattan style
### Aliases: validate_bibliography

### ** Examples

## Not run: 
##D bib_temp <- tempfile(fileext = ".bib")
##D url_bib <- 
##D   paste0("https://raw.githubusercontent.com/HughParsonage/",
##D          "grattex/e6cab97145d38890e44e83d122e995e3b8936fc6",
##D          "/bib/Grattan-Master-Bibliography.bib")
##D 
##D download.file(url_bib, destfile = bib_temp)
##D validate_bibliography(file = bib_temp)
##D 
##D bib_temp <- tempfile(fileext = ".bib")
##D url_bib <- 
##D   paste0("https://raw.githubusercontent.com/HughParsonage/",
##D          "grattex/8f7f52a28789d12a363ceb30cea3b41f590ae58a",
##D          "/bib/Grattan-Master-Bibliography.bib")
##D download.file(url_bib, destfile = bib_temp)
##D validate_bibliography(file = bib_temp)
## End(Not run)




