library(XML)


### Name: [.XMLNode
### Title: Convenience accessors for the children of XMLNode objects.
### Aliases: [.XMLNode [[.XMLNode [[.XMLInternalElementNode
###   [[.XMLDocumentContent
### Keywords: IO file

### ** Examples


 f = system.file("exampleData", "gnumeric.xml", package = "XML")

 top = xmlRoot(xmlTreeParse(f))

  # Get the first RowInfo element.
 top[["Sheets"]][[1]][["Rows"]][["RowInfo"]]

  # Get a list containing only the first row element
 top[["Sheets"]][[1]][["Rows"]]["RowInfo"]
 top[["Sheets"]][[1]][["Rows"]][1]

  # Get all of the RowInfo elements by position
 top[["Sheets"]][[1]][["Rows"]][1:xmlSize(top[["Sheets"]][[1]][["Rows"]])]

  # But more succinctly and accurately, get all of the RowInfo elements
 top[["Sheets"]][[1]][["Rows"]]["RowInfo", all = TRUE]




