library(XML)


### Name: xmlSearchNs
### Title: Find a namespace definition object by searching ancestor nodes
### Aliases: xmlSearchNs coerce,XMLNamespaceRef,character-method
### Keywords: programming data

### ** Examples

 txt = '<top xmlns:r="http://www.r-project.org"><section><bottom/></section></top>'

 doc = xmlParse(txt)
 bottom = xmlRoot(doc)[[1]][[1]]
 xmlSearchNs(bottom, "r")



