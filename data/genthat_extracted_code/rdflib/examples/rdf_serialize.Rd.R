library(rdflib)


### Name: rdf_serialize
### Title: Serialize an RDF Document
### Aliases: rdf_serialize

### ** Examples

infile <- system.file("extdata", "dc.rdf", package="redland")
out <- tempfile("file", fileext = ".rdf")

some_rdf <- rdf_parse(infile)
rdf_add(some_rdf,
    subject = "http://www.dajobe.org/dave-beckett",
    predicate = "http://www.w3.org/1999/02/22-rdf-syntax-ns#type",
    object = "http://xmlns.com/foaf/0.1/Person")
rdf_serialize(some_rdf, out)

## With a namespace
rdf_serialize(some_rdf,
          out,
          format = "turtle",
          namespace = c(dc = "http://purl.org/dc/elements/1.1/",
          foaf = "http://xmlns.com/foaf/0.1/")
          )

readLines(out)



