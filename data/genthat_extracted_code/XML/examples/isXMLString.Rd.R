library(XML)


### Name: isXMLString
### Title: Facilities for working with XML strings
### Aliases: isXMLString xml xmlParseString XMLString-class
### Keywords: IO

### ** Examples

 isXMLString("a regular string < 20 characters long")
 isXMLString("<a><b>c</b></a>")

 xmlParseString("<a><b>c</b></a>")

  # We can lie!
 isXMLString(xml("foo"))



