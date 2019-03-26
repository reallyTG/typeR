library(XML)


### Name: xmlTreeParse
### Title: XML Parser
### Aliases: xmlTreeParse htmlTreeParse htmlParse xmlInternalTreeParse
###   xmlNativeTreeParse xmlParse xmlSchemaParse
### Keywords: file IO

### ** Examples

 fileName <- system.file("exampleData", "test.xml", package="XML")
   # parse the document and return it in its standard format.

 xmlTreeParse(fileName)

   # parse the document, discarding comments.
  
 xmlTreeParse(fileName, handlers=list("comment"=function(x,...){NULL}), asTree = TRUE)

   # print the entities
 invisible(xmlTreeParse(fileName,
            handlers=list(entity=function(x) {
                                    cat("In entity",x$name, x$value,"\n")
                                    x}
                                  ), asTree = TRUE
                          )
          )

 # Parse some XML text.
 # Read the text from the file
 xmlText <- paste(readLines(fileName), "\n", collapse="")

 print(xmlText)
 xmlTreeParse(xmlText, asText=TRUE)


    # with version 1.4.2 we can pass the contents of an XML
    # stream without pasting them.
 xmlTreeParse(readLines(fileName), asText=TRUE)


 # Read a MathML document and convert each node
 # so that the primary class is 
 #   <name of tag>MathML
 # so that we can use method  dispatching when processing
 # it rather than conditional statements on the tag name.
 # See plotMathML() in examples/.
 fileName <- system.file("exampleData", "mathml.xml",package="XML")
m <- xmlTreeParse(fileName, 
                  handlers=list(
                   startElement = function(node){
                   cname <- paste(xmlName(node),"MathML", sep="",collapse="")
                   class(node) <- c(cname, class(node)); 
                   node
                }))



  # In this example, we extract _just_ the names of the
  # variables in the mtcars.xml file. 
  # The names are the contents of the <variable>
  # tags. We discard all other tags by returning NULL
  # from the startElement handler.
  #
  # We cumulate the names of variables in a character
  # vector named `vars'.
  # We define this within a closure and define the 
  # variable function within that closure so that it
  # will be invoked when the parser encounters a <variable>
  # tag.
  # This is called with 2 arguments: the XMLNode object (containing
  # its children) and the list of attributes.
  # We get the variable name via call to xmlValue().

  # Note that we define the closure function in the call and then 
  # create an instance of it by calling it directly as
  #   (function() {...})()

  # Note that we can get the names by parsing
  # in the usual manner and the entire document and then executing
  # xmlSApply(xmlRoot(doc)[[1]], function(x) xmlValue(x[[1]]))
  # which is simpler but is more costly in terms of memory.
 fileName <- system.file("exampleData", "mtcars.xml", package="XML")
 doc <- xmlTreeParse(fileName,  handlers = (function() { 
                                 vars <- character(0) ;
                                list(variable=function(x, attrs) { 
                                                vars <<- c(vars, xmlValue(x[[1]])); 
                                                NULL}, 
                                     startElement=function(x,attr){
                                                   NULL
                                                  }, 
                                     names = function() {
                                                 vars
                                             }
                                    )
                               })()
                     )

  # Here we just print the variable names to the console
  # with a special handler.
 doc <- xmlTreeParse(fileName, handlers = list(
                                  variable=function(x, attrs) {
                                             print(xmlValue(x[[1]])); TRUE
                                           }), asTree=TRUE)


  # This should raise an error.
  try(xmlTreeParse(
            system.file("exampleData", "TestInvalid.xml", package="XML"),
            validate=TRUE))

## Not run: 
##D  # Parse an XML document directly from a URL.
##D  # Requires Internet access.
##D  xmlTreeParse("http://www.omegahat.net/Scripts/Data/mtcars.xml", asText=TRUE)
## End(Not run)

  counter = function() {
              counts = integer(0)
              list(startElement = function(node) {
                                     name = xmlName(node)
                                     if(name %in% names(counts))
                                          counts[name] <<- counts[name] + 1
                                     else
                                          counts[name] <<- 1
                                  },
                    counts = function() counts)
            }

   h = counter()
   xmlParse(system.file("exampleData", "mtcars.xml", package="XML"),  handlers = h)
   h$counts()



 f = system.file("examples", "index.html", package = "XML")
 htmlTreeParse(readLines(f), asText = TRUE)
 htmlTreeParse(readLines(f))

  # Same as 
 htmlTreeParse(paste(readLines(f), collapse = "\n"), asText = TRUE)


 getLinks = function() { 
       links = character() 
       list(a = function(node, ...) { 
                   links <<- c(links, xmlGetAttr(node, "href"))
                   node 
                }, 
            links = function()links)
     }

 h1 = getLinks()
 htmlTreeParse(system.file("examples", "index.html", package = "XML"),
               handlers = h1)
 h1$links()

 h2 = getLinks()
 htmlTreeParse(system.file("examples", "index.html", package = "XML"),
              handlers = h2, useInternalNodes = TRUE)
 all(h1$links() == h2$links())

  # Using flat trees
 tt = xmlHashTree()
 f = system.file("exampleData", "mtcars.xml", package="XML")
 xmlTreeParse(f, handlers = list(.startElement = tt[[".addNode"]]))
 xmlRoot(tt)



 doc = xmlTreeParse(f, useInternalNodes = TRUE)

 sapply(getNodeSet(doc, "//variable"), xmlValue)
         
 #free(doc) 


  # character set encoding for HTML
 f = system.file("exampleData", "9003.html", package = "XML")
   # we specify the encoding
 d = htmlTreeParse(f, encoding = "UTF-8")
   # get a different result if we do not specify any encoding
 d.no = htmlTreeParse(f)
   # document with its encoding in the HEAD of the document.
 d.self = htmlTreeParse(system.file("exampleData", "9003-en.html",package = "XML"))
   # XXX want to do a test here to see the similarities between d and
   # d.self and differences between d.no


  # include
 f = system.file("exampleData", "nodes1.xml", package = "XML")
 xmlRoot(xmlTreeParse(f, xinclude = FALSE))
 xmlRoot(xmlTreeParse(f, xinclude = TRUE))

 f = system.file("exampleData", "nodes2.xml", package = "XML")
 xmlRoot(xmlTreeParse(f, xinclude = TRUE))

  # Errors
  try(xmlTreeParse("<doc><a> & < <?pi > </doc>"))

    # catch the error by type.
 tryCatch(xmlTreeParse("<doc><a> & < <?pi > </doc>"),
                "XMLParserErrorList" = function(e) {
                     cat("Errors in XML document\n", e$message, "\n")
                                                    })

    #  terminate on first error            
  try(xmlTreeParse("<doc><a> & < <?pi > </doc>", error = NULL))

    #  see xmlErrorCumulator in the XML package 


  f = system.file("exampleData", "book.xml", package = "XML")
  doc.trim = xmlInternalTreeParse(f, trim = TRUE)
  doc = xmlInternalTreeParse(f, trim = FALSE)
  xmlSApply(xmlRoot(doc.trim), class)
      # note the additional XMLInternalTextNode objects
  xmlSApply(xmlRoot(doc), class)


  top = xmlRoot(doc)
  textNodes = xmlSApply(top, inherits, "XMLInternalTextNode")
  sapply(xmlChildren(top)[textNodes], xmlValue)


     # Storing nodes
   f = system.file("exampleData", "book.xml", package = "XML")
   titles = list()
   xmlTreeParse(f, handlers = list(title = function(x)
                                  titles[[length(titles) + 1]] <<- x))
   sapply(titles, xmlValue)
   rm(titles)



