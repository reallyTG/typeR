library(handlr)


### Name: schema_org_writer
### Title: Schema org writer
### Aliases: schema_org_writer

### ** Examples

(z <- system.file('extdata/bibtex.bib', package = "handlr"))
(tmp <- bibtex_reader(z))
schema_org_writer(tmp)
schema_org_writer(tmp, pretty = FALSE)

# many citeproc to schema 
z <- system.file('extdata/citeproc-many.json', package = "handlr")
w <- citeproc_reader(x = z)
schema_org_writer(w)
schema_org_writer(w, pretty = FALSE)



