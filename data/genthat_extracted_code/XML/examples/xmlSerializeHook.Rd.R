library(XML)


### Name: xmlSerializeHook
### Title: Functions that help serialize and deserialize XML internal
###   objects
### Aliases: xmlSerializeHook xmlDeserializeHook
### Keywords: IO

### ** Examples

z = newXMLNode("foo")
f = system.file("exampleData", "tides.xml", package = "XML")
doc = xmlParse(f)
hdoc = as(doc, "XMLHashTree")

nodes = getNodeSet(doc, "//pred")

saveRDS(list(a = 1:10, z = z, doc = doc, hdoc = hdoc, nodes = nodes), "tmp.rda",
          refhook = xmlSerializeHook)

v = readRDS("tmp.rda", refhook = xmlDeserializeHook)



