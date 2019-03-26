library(XML)


### Name: xmlDOMApply
### Title: Apply function to nodes in an XML tree/DOM.
### Aliases: xmlDOMApply
### Keywords: file

### ** Examples

 dom <- xmlTreeParse(system.file("exampleData","mtcars.xml", package="XML"))
 tagNames <- function() {
    tags <- character(0)
    add <- function(x) {
      if(inherits(x, "XMLNode")) {
        if(is.na(match(xmlName(x), tags)))
           tags <<- c(tags, xmlName(x))
      }

      NULL
    }

    return(list(add=add, tagNames = function() {return(tags)}))
 }

 h <- tagNames()
 xmlDOMApply(xmlRoot(dom), h$add) 
 h$tagNames()



