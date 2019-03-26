library(RefManageR)


### Name: $.BibEntry
### Title: Extract fields from a BibEntry object
### Aliases: $.BibEntry

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
bib[[50:55]]$author
bib[[seq_len(5)]]$bibtype



