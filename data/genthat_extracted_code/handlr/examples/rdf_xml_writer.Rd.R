library(handlr)


### Name: rdf_xml_writer
### Title: RDF XML writer
### Aliases: rdf_xml_writer

### ** Examples

if (requireNamespace("jsonld") && interactive()) {
  library("jsonld")
  z <- system.file('extdata/citeproc.json', package = "handlr")
  (tmp <- citeproc_reader(z))

  (z <- system.file('extdata/bibtex.bib', package = "handlr"))
  (tmp <- bibtex_reader(z))
  rdf_xml_writer(z = tmp)
  cat(rdf_xml_writer(z = tmp))
}



