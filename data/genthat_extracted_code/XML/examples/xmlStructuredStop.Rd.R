library(XML)


### Name: xmlStructuredStop
### Title: Condition/error handler functions for XML parsing
### Aliases: xmlStructuredStop xmlErrorCumulator
### Keywords: IO programming

### ** Examples

  tryCatch( xmlTreeParse("<a><b></a>", asText = TRUE, error = NULL),
                 XMLError = function(e) {
                    cat("There was an error in the XML at line", 
                          e$line, "column", e$col, "\n",
                         e$message, "\n")
                })



