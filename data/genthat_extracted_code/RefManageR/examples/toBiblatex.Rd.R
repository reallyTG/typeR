library(RefManageR)


### Name: toBiblatex
### Title: Convert BibEntry objects to BibTeX or BibLaTeX
### Aliases: toBiblatex toBibtex.BibEntry toBibtex toBibtex.BibEntry
### Keywords: IO database utilities

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
toBiblatex(bib[70:72])
toBibtex(bib[70:72])



