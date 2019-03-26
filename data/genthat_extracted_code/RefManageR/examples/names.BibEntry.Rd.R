library(RefManageR)


### Name: names<-.BibEntry
### Title: Names (keys) of a BibEntry object
### Aliases: names<-.BibEntry names.BibEntry names<-.BibEntry
### Keywords: attribute

### ** Examples

bib <- ReadBib(system.file("Bib", "test.bib", package = "RefManageR"))
names(bib)
names(bib)[1] <- 'newkey'



