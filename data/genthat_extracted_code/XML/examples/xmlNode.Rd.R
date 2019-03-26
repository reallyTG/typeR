library(XML)


### Name: xmlNode
### Title: Create an XML node
### Aliases: xmlNode xmlTextNode xmlPINode xmlCDataNode xmlCommentNode
### Keywords: file

### ** Examples


 # node named arg with two children: name and defaultValue
 # Both of these have a text node as their child.
 n <- xmlNode("arg", attrs = c(default="TRUE"),
               xmlNode("name", "foo"), xmlNode("defaultValue","1:10"))


  # internal C-level node.
 a = newXMLNode("arg", attrs = c(default = "TRUE"),
                newXMLNode("name", "foo"),
                newXMLNode("defaultValue", "1:10"))

 xmlAttrs(a) = c(a = 1, b = "a string")

 xmlAttrs(a) = c(a = 1, b = "a string", append = FALSE)

 newXMLNamespace(a, c("r" = "http://www.r-project.org"))
 xmlAttrs(a) = c("r:class" = "character") 


 xmlAttrs(a[[1]]) = c("r:class" = "character") 


  # Using a character vector as a namespace definitions
 x = xmlNode("bob",
             namespaceDefinitions = c(r = "http://www.r-project.org",
                                      omg = "http://www.omegahat.net"))



