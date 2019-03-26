library(tosca)


### Name: removeXML
### Title: Removes XML/HTML Tags and Umlauts
### Aliases: removeXML removeUmlauts removeHTML
### Keywords: manip

### ** Examples

xml <- "<text>Some <b>important</b> text</text>"
removeXML(xml)

x <- "&#x00f8; &#248; &oslash;"
removeHTML(x=x, symbolList = 1, dec=TRUE, hex=FALSE, entity=FALSE, delete = FALSE)
removeHTML(x=x, symbolList = c(1,3))

y <- c("Bl\UFChende Apfelb\UE4ume")
removeUmlauts(y)




