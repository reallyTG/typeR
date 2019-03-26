library(XML)


### Name: getSibling
### Title: Manipulate sibling XML nodes
### Aliases: getSibling addSibling
### Keywords: IO

### ** Examples

  
          # Reading Apple's iTunes files
     # 
     #           Here we read  a "censored" "database" of songs from Apple's  iTune application
     #           which is stored in a property list.  The format is quite generic and 
     #            the fields for each song are given in the form
     #           
     #             <key>Artist</key><string>Person's name</string>
     # 	  
     #           So to find the names of the artists for all the songs, we want to 
     #           find all the <key>Artist<key> nodes and then get their next sibling
     #           which has the actual value.
     #         
     #           More information can be found in .
     # 	
           fileName = system.file("exampleData", "iTunes.plist", package = "XML")

           doc = xmlParse(fileName)
           nodes = getNodeSet(doc, "//key[text() = 'Artist']")
           sapply(nodes, function(x)  xmlValue(getSibling(x)))
	

      f = system.file("exampleData", "simple.xml", package = "XML")
      tt = as(xmlParse(f), "XMLHashTree") 

       tt

      e = getSibling(xmlRoot(tt)[[1]])
        # and back to the first one again by going backwards along the sibling list.
      getSibling(e, after = FALSE)


         # This also works for multiple top-level "root" nodes
      f = system.file("exampleData", "job.xml", package = "XML")
      tt = as(xmlParse(f), "XMLHashTree")
       x = xmlRoot(tt, skip = FALSE)
       getSibling(x)
       getSibling(getSibling(x), after = FALSE)



