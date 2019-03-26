library(XML)


### Name: [<-.XMLNode
### Title: Assign sub-nodes to an XML node
### Aliases: [<-.XMLNode [[<-.XMLNode
### Keywords: IO file

### ** Examples

 top <- xmlNode("top", xmlNode("next","Some text"))
 top[["second"]] <- xmlCDataNode("x <- 1:10")
 top[[3]] <- xmlNode("tag",attrs=c(id="name"))



