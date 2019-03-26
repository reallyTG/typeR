library(XML)


### Name: compareXMLDocs
### Title: Indicate differences between two XML documents
### Aliases: compareXMLDocs
### Keywords: IO

### ** Examples


tt = 
 '<x>
     <a>text</a>
     <b foo="1"/>
     <c bar="me">
        <d>a phrase</d>
     </c>
  </x>'

  a = xmlParse(tt, asText = TRUE)
  b = xmlParse(tt, asText = TRUE)
  d = getNodeSet(b, "//d")[[1]]
  xmlName(d) = "bob"
  addSibling(xmlParent(d), newXMLNode("c"))
  
  compareXMLDocs(a, b)



