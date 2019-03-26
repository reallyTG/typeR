library(XML)


### Name: XMLAttributes-class
### Title: Class '"XMLAttributes"'
### Aliases: XMLAttributes-class [,XMLAttributes-method
###   show,XMLAttributes-method
### Keywords: classes

### ** Examples

  nn = newXMLNode("foo", attrs = c(a = "123", 'r:show' = "true"),
                   namespaceDefinitions = c(r = "http://www.r-project.org"))
  a = xmlAttrs(nn)
  a["show"]



