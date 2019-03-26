library(RefManageR)


### Name: [[.BibEntry
### Title: Extract entries from a BibEntry object by index
### Aliases: [[.BibEntry
### Keywords: database list manip

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
bib[[20:21]]
bib[c("hyman", "loh")]

## Note this is FALSE because [[ does not inherit from the dropped parent entry while [ does.
identical(bib[1], bib[[1]])



