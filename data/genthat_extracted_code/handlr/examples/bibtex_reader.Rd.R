library(handlr)


### Name: bibtex_reader
### Title: bibtex reader
### Aliases: bibtex_reader

### ** Examples

(z <- system.file('extdata/crossref.bib', package = "handlr"))
bibtex_reader(x = z)
(z <- system.file('extdata/bibtex.bib', package = "handlr"))
bibtex_reader(x = z)

# many at once 
(z <- system.file('extdata/bib-many.bib', package = "handlr"))
bibtex_reader(x = z)



