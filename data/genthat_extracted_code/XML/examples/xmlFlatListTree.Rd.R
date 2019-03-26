library(XML)


### Name: xmlFlatListTree
### Title: Constructors for trees stored as flat list of nodes with
###   information about parents and children.
### Aliases: xmlFlatListTree xmlHashTree
### Keywords: IO

### ** Examples

 f = system.file("exampleData", "dataframe.xml", package = "XML")
 tr  = xmlHashTree()
 xmlTreeParse(f, handlers = list(.startElement = tr[[".addNode"]]))

 tr # print the tree on the screen

  # Get the two child nodes of the dataframe node.
 xmlChildren(tr$dataframe)

  # Find the names of all the nodes.
 objects(tr)
  # Which nodes have children
 objects(tr$.children)

  # Which nodes are leaves, i.e. do not have children
 setdiff(objects(tr), objects(tr$.children))

  # find the class of each of these leaf nodes.
 sapply(setdiff(objects(tr), objects(tr$.children)),
         function(id) class(tr[[id]]))

  # distribution of number of children
 sapply(tr$.children, length)


  # Get the first A node
 tr$A

  # Get is parent node.
 xmlParent(tr$A)


 f = system.file("exampleData", "allNodeTypes.xml", package = "XML")

   # Convert the document
 r = xmlInternalTreeParse(f, xinclude = TRUE)
 ht = as(r, "XMLHashTree")
 ht
 
  # work on the root node, or any node actually
 as(xmlRoot(r), "XMLHashTree")

  # Example of making copies of an XMLHashTreeNode object to create a separate tree.
 f = system.file("exampleData", "simple.xml", package = "XML")
 tt = as(xmlParse(f), "XMLHashTree")

 xmlRoot(tt)[[1]]
 xmlRoot(tt)[[1, copy = TRUE]]

 table(unlist(eapply(tt, xmlName)))
 # if any of the nodes had any attributes
 # table(unlist(eapply(tt, xmlAttrs)))



