library(handlr)


### Name: codemeta_writer
### Title: codemeta writer
### Aliases: codemeta_writer

### ** Examples

(x <- system.file('extdata/crossref.bib', package = "handlr"))
(z <- bibtex_reader(x))
codemeta_writer(z)

# many citeproc to schema 
z <- system.file('extdata/citeproc-many.json', package = "handlr")
w <- citeproc_reader(x = z)
codemeta_writer(w)
codemeta_writer(w, pretty = FALSE)



