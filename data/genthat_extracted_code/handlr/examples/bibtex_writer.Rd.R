library(handlr)


### Name: bibtex_writer
### Title: bibtex writer
### Aliases: bibtex_writer

### ** Examples

(z <- system.file('extdata/citeproc.json', package = "handlr"))
(tmp <- citeproc_reader(z))
bibtex_writer(z = tmp)
cat(bibtex_writer(z = tmp), sep = "\n")

(z <- system.file('extdata/bibtex2.bib', package = "handlr"))
z <- bibtex_reader(z)
bibtex_writer(z)
cat(bibtex_writer(z), sep = "\n")

# give a bibtex key
cat(bibtex_writer(z, "foobar89"), sep = "\n")

# many at once 
(z <- system.file('extdata/bib-many.bib', package = "handlr"))
out <- bibtex_reader(x = z)
bibtex_writer(out)



