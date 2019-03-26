library(RefManageR)


### Name: sort.BibEntry
### Title: Sort a BibEntry Object
### Aliases: sort.BibEntry
### Keywords: manip methods

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name)[[70:73]])
BibOptions(sorting = "none")
bib
sort(bib, sorting = "nyt")
sort(bib, sorting = "ynt")
BibOptions(restore.defaults = TRUE)



