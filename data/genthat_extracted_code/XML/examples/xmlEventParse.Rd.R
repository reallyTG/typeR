library(XML)


### Name: xmlEventParse
### Title: XML Event/Callback element-wise Parser
### Aliases: xmlEventParse
### Keywords: file IO

### ** Examples

 fileName <- system.file("exampleData", "mtcars.xml", package="XML")

   # Print the name of each XML tag encountered at the beginning of each
   # tag.
   # Uses the libxml SAX parser.
 xmlEventParse(fileName,
                list(startElement=function(name, attrs){
                                    cat(name,"\n")
                                  }),
                useTagName=FALSE, addContext = FALSE)


## Not run: 
##D   # Parse the text rather than a file or URL by reading the URL's contents
##D   # and making it a single string. Then call xmlEventParse
##D xmlURL <- "http://www.omegahat.net/Scripts/Data/mtcars.xml"
##D xmlText <- paste(scan(xmlURL, what="",sep="\n"),"\n",collapse="\n")
##D xmlEventParse(xmlText, asText=TRUE)
## End(Not run)

    # Using a state object to share mutable data across callbacks
f <- system.file("exampleData", "gnumeric.xml", package = "XML")
zz <- xmlEventParse(f,
                    handlers = list(startElement=function(name, atts, .state) {
                                                     .state = .state + 1
                                                     print(.state)
                                                     .state
                                                 }), state = 0)
print(zz)




    # Illustrate the startDocument and endDocument handlers.
xmlEventParse(fileName,
               handlers = list(startDocument = function() {
                                                 cat("Starting document\n")
                                               },
                               endDocument = function() {
                                                 cat("ending document\n")
                                             }),
               saxVersion = 2)




if(libxmlVersion()$major >= 2) {


 startElement = function(x, ...) cat(x, "\n")

 xmlEventParse(ff <- file(f), handlers = list(startElement = startElement))
 close(ff)

 # Parse with a function providing the input as needed.
 xmlConnection = 
  function(con) {

   if(is.character(con))
     con = file(con, "r")
  
   if(isOpen(con, "r"))
     open(con, "r")

   function(len) {

     if(len < 0) {
        close(con)
        return(character(0))
     }

      x = character(0)
      tmp = ""
    while(length(tmp) > 0 && nchar(tmp) == 0) {
      tmp = readLines(con, 1)
      if(length(tmp) == 0)
        break
      if(nchar(tmp) == 0)
        x = append(x, "\n")
      else
        x = tmp
    }
    if(length(tmp) == 0)
      return(tmp)
  
    x = paste(x, collapse="")

    x
  }
 }

 ## No test: 
## this leaves a connection open
 ## xmlConnection would need amending to return the connection.
 ff = xmlConnection(f)
 xmlEventParse(ff, handlers = list(startElement = startElement))
 
## End(No test)

  # Parse from a connection. Each time the parser needs more input, it
  # calls readLines(<con>, 1)
 xmlEventParse(ff <-file(f),  handlers = list(startElement = startElement))
 close(ff)

  # using SAX 2
 h = list(startElement = function(name, attrs, namespace, allNamespaces){ 
                                 cat("Starting", name,"\n")
                                 if(length(attrs))
                                     print(attrs)
                                 print(namespace)
                                 print(allNamespaces)
                         },
          endElement = function(name, uri) {
                          cat("Finishing", name, "\n")
            }) 
 xmlEventParse(system.file("exampleData", "namespaces.xml", package="XML"),
               handlers = h, saxVersion = 2)


 # This example is not very realistic but illustrates how to use the
 # branches argument. It forces the creation of complete nodes for
 # elements named <b> and extracts the id attribute.
 # This could be done directly on the startElement, but this just
 # illustrates the mechanism.
 filename = system.file("exampleData", "branch.xml", package="XML")
 b.counter = function() {
                nodes <- character()
                f = function(node) { nodes <<- c(nodes, xmlGetAttr(node, "id"))}
                list(b = f, nodes = function() nodes)
             }

  b = b.counter()
  invisible(xmlEventParse(filename, branches = b["b"]))
  b$nodes()


  filename = system.file("exampleData", "branch.xml", package="XML")
   
  invisible(xmlEventParse(filename, branches = list(b = function(node) {
                          print(names(node))})))
  invisible(xmlEventParse(filename, branches = list(b = function(node) {
                          print(xmlName(xmlChildren(node)[[1]]))})))
}

  
  ############################################
  # Stopping the parser mid-way and an example of using XMLParserContextFunction.

  startElement =
  function(ctxt, name, attrs, ...)  {
    print(ctxt)
      print(name)
      if(name == "rewriteURI") {
           cat("Terminating parser\n")
	   xmlStopParser(ctxt)
      }
  }
  class(startElement) = "XMLParserContextFunction"  
  endElement =
  function(name, ...) 
    cat("ending", name, "\n")

  fileName = system.file("exampleData", "catalog.xml", package = "XML")
  xmlEventParse(fileName, handlers = list(startElement = startElement,
                                          endElement = endElement))



