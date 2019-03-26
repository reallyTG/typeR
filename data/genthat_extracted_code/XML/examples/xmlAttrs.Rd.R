library(XML)


### Name: xmlAttrs
### Title: Get the list of attributes of an XML node.
### Aliases: xmlAttrs xmlAttrs<- xmlAttrs.XMLElementDef xmlAttrs<-,XMLNode
###   xmlAttrs<-,XMLInternalNode xmlAttrs<-,XMLNode-method
###   xmlAttrs<-,XMLInternalElementNode-method xmlAttrs.XMLNode
###   xmlAttrs.XMLInternalNode
### Keywords: IO file

### ** Examples

 fileName <- system.file("exampleData", "mtcars.xml", package="XML") 
 doc <- xmlTreeParse(fileName)

 xmlAttrs(xmlRoot(doc))

 xmlAttrs(xmlRoot(doc)[["variables"]])


 doc <- xmlParse(fileName)
 d = xmlRoot(doc)

 xmlAttrs(d)
 xmlAttrs(d) <- c(name = "Motor Trend fuel consumption data",
                  author = "Motor Trends")
 xmlAttrs(d)

   # clear all the attributes and then set new ones.
 removeAttributes(d)
 xmlAttrs(d) <- c(name = "Motor Trend fuel consumption data",
                  author = "Motor Trends")


     # Show how to get the attributes with and without the prefix and
     # with and without the URLs for the namespaces.
  doc = xmlParse('<doc xmlns:r="http://www.r-project.org">
                    <el r:width="10" width="72"/>
                    <el width="46"/>
                    </doc>')

  xmlAttrs(xmlRoot(doc)[[1]], TRUE, TRUE)
  xmlAttrs(xmlRoot(doc)[[1]], FALSE, TRUE)
  xmlAttrs(xmlRoot(doc)[[1]], TRUE, FALSE)
  xmlAttrs(xmlRoot(doc)[[1]], FALSE, FALSE)



