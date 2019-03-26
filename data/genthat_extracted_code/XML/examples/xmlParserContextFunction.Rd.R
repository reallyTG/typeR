library(XML)


### Name: xmlParserContextFunction
### Title: Identifies function as expecting an xmlParserContext argument
### Aliases: xmlParserContextFunction
### Keywords: IO programming

### ** Examples


  fun = function(context, ...) {
             # do things to parse the node
             # using the context if necessary.
           cat("In XMLParserContextFunction\n")
           xmlStopParser(context)
         }
  fun = xmlParserContextFunction(fun)

  txt = "<doc><a/></doc>"
  # doesn't work for xmlTreeParse()
  #   xmlTreeParse(txt, handlers = list(a = fun))

  #  but does in xmlEventParse().
  xmlEventParse(txt, handlers = list(startElement = fun), asText = TRUE)




