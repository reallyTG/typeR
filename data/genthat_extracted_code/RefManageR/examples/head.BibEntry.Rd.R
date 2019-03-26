library(RefManageR)


### Name: head.BibEntry
### Title: Return the first or last part of a BibEntry object
### Aliases: head.BibEntry tail.BibEntry tail.BibEntry

### ** Examples

file <- system.file("Bib", "biblatexExamples.bib", package = "RefManageR")
BibOptions(check.entries = FALSE)
bib <- ReadBib(file)
tail(bib, 2, suppress.messages = FALSE)
bib <- head(bib, 1, suppress.messages = TRUE)



