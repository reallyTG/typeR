library(handlr)


### Name: citeproc_reader
### Title: citeproc reader
### Aliases: citeproc_reader

### ** Examples

# single
z <- system.file('extdata/citeproc.json', package = "handlr")
citeproc_reader(x = z)

# many
z <- system.file('extdata/citeproc-many.json', package = "handlr")
citeproc_reader(x = z)



