library(XML)


### Name: xmlToS4
### Title: General mechanism for mapping an XML node to an S4 object
### Aliases: xmlToS4 xmlToS4,XMLInternalNode-method
### Keywords: programming IO

### ** Examples

 txt =
 "<doc><part><name>ABC</name><type>XYZ</type><cost>3.54</cost><status>available</status></part></doc>"
 doc = xmlParse(txt)

 setClass("part", representation(name = "character",
                                 type = "character",
                                 cost = "numeric",
                                 status= "character"))
 xmlToS4(xmlRoot(doc)[["part"]])



