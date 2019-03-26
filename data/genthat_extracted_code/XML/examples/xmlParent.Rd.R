library(XML)


### Name: xmlParent
### Title: Get parent node of XMLInternalNode or ancestor nodes
### Aliases: xmlParent xmlAncestors xmlParent.XMLInternalNode
###   xmlParent,XMLInternalNode-method xmlParent,XMLHashTreeNode-method
###   xmlParent,XMLTreeNode-method
### Keywords: file IO

### ** Examples


  top = newXMLNode("doc")
  s = newXMLNode("section", attr = c(title = "Introduction"))
  a = newXMLNode("article", s)
  addChildren(top, a)

  xmlName(xmlParent(s))
  xmlName(xmlParent(xmlParent(s)))


    # Find the root node.
  root = a
  while(!is.null(xmlParent(root)))
      root = xmlParent(root)

   # find the names of the parent nodes of each 'h' node.
   # use a global variable to "simplify" things and not use a closure.

  filename = system.file("exampleData", "branch.xml", package = "XML")
  parentNames <- character()
  xmlParse(filename,
                handlers =
                  list(h = function(x) {
                   parentNames <<- c(parentNames, xmlName(xmlParent(x)))
                  }))

  table(parentNames)



