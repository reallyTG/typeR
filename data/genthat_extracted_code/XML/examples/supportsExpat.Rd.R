library(XML)


### Name: supportsExpat
### Title: Determines which native XML parsers are being used.
### Aliases: supportsExpat supportsLibxml
### Keywords: file

### ** Examples

     # use Expat if possible, otherwise libxml
  fileName <- system.file("exampleData", "mtcars.xml", package="XML")
  xmlEventParse(fileName, useExpat = supportsExpat())



