library(XML)


### Name: genericSAXHandlers
### Title: SAX generic callback handler list
### Aliases: genericSAXHandlers
### Keywords: file

### ** Examples

## Don't show: 
# .InitSAXMethods()
names(genericSAXHandlers())
names(genericSAXHandlers(inc=c("startElement", "endElement", "text")))
names(genericSAXHandlers(ex=c("startElement", "endElement", "text")))
## End(Don't show)



