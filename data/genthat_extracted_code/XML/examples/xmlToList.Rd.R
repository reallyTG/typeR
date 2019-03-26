library(XML)


### Name: xmlToList
### Title: Convert an XML node/document to a more R-like list
### Aliases: xmlToList
### Keywords: IO data

### ** Examples

tt = 
 '<x>
     <a>text</a>
     <b foo="1"/>
     <c bar="me">
        <d>a phrase</d>
     </c>
  </x>'

  doc = xmlParse(tt)
  xmlToList(doc)

   # use an R-level node representation
  doc = xmlTreeParse(tt)
  xmlToList(doc)



