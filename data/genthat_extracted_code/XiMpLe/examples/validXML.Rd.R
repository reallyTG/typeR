library(XiMpLe)


### Name: validXML
### Title: Validate S4 objects of XiMpLe XML classes
### Aliases: validXML validXML,-methods validXML,XiMpLe.doc-method
###   validXML,XiMpLe.node-method validXML,XiMpLe.XML-method
###   validXML,XiMpLe.XML-method
### Keywords: methods

### ** Examples

HTMLish <- XMLValidity(
   children=list(
     body=c("a", "p", "ol", "ul", "strong"),
     head=c("title"),
     html=c("head", "body"),
     li=c("a", "br", "strong"),
     ol=c("li"),
     p=c("a", "br", "ol", "ul", "strong"),
     ul=c("li")
   ),
   attrs=list(
     a=c("href", "name"),
     p=c("align")
   ),
   allChildren=c("!--"),
   allAttrs=c("id", "class"),
   empty=c("br")
)
# make XML object
validChildNodes <- XMLNode("html",
  XMLNode("head",
    XMLNode("!--", "comment always passes"),
    XMLNode("title", "test")
  ),
  XMLNode("body",
    XMLNode("p",
      XMLNode("a", "my link"),
      XMLNode("br"),
      "text goes on"
    )
  )
)
invalidChildNodes <- XMLNode("html",
  XMLNode("head",
    XMLNode("title", 
      XMLNode("body", "test")
    )
  )
)

# do validity checks
# the first should pass
validXML(
  validChildNodes,
  validity=HTMLish
)

# now this one should cause a warning and return FALSE
validXML(
  invalidChildNodes,
  validity=HTMLish,
  warn=TRUE
)



