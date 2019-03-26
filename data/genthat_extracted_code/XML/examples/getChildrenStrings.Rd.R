library(XML)


### Name: getChildrenStrings
### Title: Get the individual
### Aliases: getChildrenStrings
### Keywords: programming

### ** Examples

doc = xmlParse("<doc><a>a string</a> some text <b>another</b></doc>")
getChildrenStrings(xmlRoot(doc))

doc = xmlParse("<doc><a>a string</a> some text <b>another</b><c/><d>abc<e>xyz</e></d></doc>")
getChildrenStrings(xmlRoot(doc))



