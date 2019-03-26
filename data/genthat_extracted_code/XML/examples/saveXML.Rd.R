library(XML)


### Name: saveXML
### Title: Output internal XML Tree
### Aliases: saveXML saveXML.XMLInternalDocument saveXML.XMLInternalDOM
###   saveXML.XMLInternalNode saveXML.XMLNode saveXML.XMLOutputStream
###   coerce,XMLInternalDocument,character-method
###   coerce,XMLInternalDOM,character-method
###   coerce,XMLInternalNode,character-method saveXML,XMLFlatTree-method
###   saveXML,XMLInternalDocument-method saveXML,XMLInternalDOM-method
###   saveXML,XMLInternalNode-method saveXML,XMLNode-method
###   saveXML,XMLOutputStream-method saveXML,HTMLInternalDocument-method
### Keywords: IO file

### ** Examples


 b = newXMLNode("bob")
 saveXML(b)

 f = tempfile()
 saveXML(b, f)
 doc = xmlInternalTreeParse(f)
 saveXML(doc)


con <- xmlOutputDOM()
con$addTag("author", "Duncan Temple Lang")
con$addTag("address",  close=FALSE)
con$addTag("office", "2C-259")
con$addTag("street", "Mountain Avenue.")
con$addTag("phone", close=FALSE)
con$addTag("area", "908", attrs=c(state="NJ"))
con$addTag("number", "582-3217")
con$closeTag() # phone
con$closeTag() # address

saveXML(con$value(), file="out.xml")


# Work with entities

 f = system.file("exampleData", "test1.xml", package = "XML")
 doc = xmlRoot(xmlTreeParse(f))
 outFile = tempfile()
 saveXML(doc, outFile)
 alt = xmlRoot(xmlTreeParse(outFile))
 if(! identical(doc, alt) )
  stop("Problems handling entities!")

 con = textConnection("test1.xml", "w")
 saveXML(doc, con)
 close(con)
 alt = get("test1.xml")
 identical(doc, alt)



 x = newXMLNode("a", "some text", newXMLNode("c", "sub text"), "more text")

 cat(saveXML(x), "\n")

 cat(as(x, "character"), "\n")


     # Showing the prefix parameter
  doc = newXMLDoc()
  n = newXMLNode("top", doc = doc)
  b = newXMLNode("bar", parent = n)

     # suppress the <?xml ...?>
  saveXML(doc, prefix = character())

     # put our own comment in
  saveXML(doc, prefix = "<!-- This is an alternative prefix -->")
     # or use a comment node.
  saveXML(doc, prefix = newXMLCommentNode("This is an alternative prefix"))



