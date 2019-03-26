library(XML)


### Name: SAXState-class
### Title: A virtual base class defining methods for SAX parsing
### Aliases: SAXState-class
### Keywords: classes

### ** Examples


# For each element in the document, grab the node name
# and increment the count in an vector for this name.

# We define an S4 class named ElementNameCounter which
# holds the vector of frequency counts for the node names.

 setClass("ElementNameCounter",
             representation(elements = "integer"), contains = "SAXState")

# Define a method for handling the opening/start of any XML node
# in the SAX streams.

 setMethod("startElement.SAX",  c(.state = "ElementNameCounter"),
           function(name, atts, .state = NULL) {

             if(name %in% names(.state@elements))
                 .state@elements[name] = as.integer(.state@elements[name] + 1)
             else
                 .state@elements[name] = as.integer(1)
             .state
           })

 filename = system.file("exampleData", "eurofxref-hist.xml.gz", package = "XML")

# Parse the file, arranging to have our startElement.SAX method invoked.
 z = xmlEventParse(filename, genericSAXHandlers(),
                   state = new("ElementNameCounter"), addContext = FALSE)

 z@elements

  # Get the contents of all the comments in a character vector.

 setClass("MySAXState",
             representation(comments = "character"), contains = "SAXState")

 setMethod("comment.SAX",  c(.state = "MySAXState"),
           function(content, .state = NULL) {
             cat("comment.SAX called for MySAXState\n")
             .state@comments <- c(.state@comments, content)
             .state
           })

 filename = system.file("exampleData", "charts.svg", package = "XML")
 st = new("MySAXState")
 z = xmlEventParse(filename, genericSAXHandlers(useDotNames = TRUE), state = st)
 z@comments





