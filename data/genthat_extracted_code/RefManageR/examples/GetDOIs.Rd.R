library(RefManageR)


### Name: GetDOIs
### Title: Search CrossRef for Document Object Identifiers for Given
###   Citations
### Aliases: GetDOIs
### Keywords: database

### ** Examples

if (interactive() && !httr::http_error("https://search.crossref.org")){
  BibOptions(check.entries = FALSE, sorting = "none")
  bib <- ReadBib(system.file("Bib", "RJC.bib", package = "RefManageR"))[1:5]
  bib <- GetDOIs(bib)
  bib$doi
}



