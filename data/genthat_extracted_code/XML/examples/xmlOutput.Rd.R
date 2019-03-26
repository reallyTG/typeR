library(XML)


### Name: xmlOutputBuffer
### Title: XML output streams
### Aliases: xmlOutputBuffer xmlOutputDOM
### Keywords: file IO

### ** Examples

 con <- xmlOutputDOM()
con$addTag("author", "Duncan Temple Lang")
con$addTag("address",  close=FALSE)
 con$addTag("office", "2C-259")
 con$addTag("street", "Mountain Avenue.")
 con$addTag("phone", close = FALSE)
   con$addTag("area", "908", attrs=c(state="NJ"))
   con$addTag("number", "582-3217")
 con$closeTag() # phone
con$closeTag() # address

con$addTag("section", close = FALSE)
 con$addNode(xmlTextNode("This is some text "))
 con$addTag("a","and a link", attrs=c(href="http://www.omegahat.net"))
 con$addNode(xmlTextNode("and some follow up text"))

 con$addTag("subsection", close = FALSE)
   con$addNode(xmlTextNode("some addtional text "))
   con$addTag("a", attrs=c(href="http://www.omegahat.net"), close=FALSE)
     con$addNode(xmlTextNode("the content of the link"))
   con$closeTag() # a
 con$closeTag() # "subsection"
con$closeTag() # section


 d <- xmlOutputDOM()
 d$addPI("S", "plot(1:10)")
 d$addCData('x <- list(1, a="&");\nx[[2]]')
 d$addComment("A comment")
 print(d$value())
 print(d$value(), indent = FALSE, tagSeparator = "")


 d = xmlOutputDOM("bob", xmlDeclaration = TRUE)
 print(d$value())

 d = xmlOutputDOM("bob", xmlDeclaration = "encoding='UTF-8'")
 print(d$value())


 d = xmlOutputBuffer("bob", header = "<?xml version='1.0' encoding='UTF-8'?>", 
                      dtd = "foo.dtd")
 d$addTag("bob")
 cat(d$value())



