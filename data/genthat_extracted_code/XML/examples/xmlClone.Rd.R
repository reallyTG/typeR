library(XML)


### Name: xmlClone
### Title: Create a copy of an internal XML document or node
### Aliases: xmlClone xmlClone,XMLInternalNode-method
###   xmlClone,XMLInternalDocument-method
### Keywords: IO programming

### ** Examples

doc =
xmlParse('<doc><author id="dtl"><firstname>Duncan</firstname><surname>Temple Lang</surname></author></doc>')

  au = xmlRoot(doc)[[1]]
     # make a copy
  other = xmlClone(au)
     # change it slightly
  xmlAttrs(other) = c(id = "dtl2")
     # add it to the children
  addChildren(xmlRoot(doc), other)



