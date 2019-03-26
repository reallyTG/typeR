library(xml2)


### Name: as_xml_document
### Title: Coerce a R list to xml nodes.
### Aliases: as_xml_document

### ** Examples

as_xml_document(list(x = list()))

# Nesting multiple nodes
as_xml_document(list(foo = list(bar = list(baz = list()))))

# attributes are stored as R attributes
as_xml_document(list(foo = structure(list(), id = "a")))
as_xml_document(list(foo = list(
     bar = structure(list(), id = "a"),
     bar = structure(list(), id = "b"))))



