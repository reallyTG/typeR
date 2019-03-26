library(shiny)


### Name: parseQueryString
### Title: Parse a GET query string from a URL
### Aliases: parseQueryString

### ** Examples

parseQueryString("?foo=1&bar=b%20a%20r")

## Not run: 
##D # Example of usage within a Shiny app
##D function(input, output, session) {
##D 
##D   output$queryText <- renderText({
##D     query <- parseQueryString(session$clientData$url_search)
##D 
##D     # Ways of accessing the values
##D     if (as.numeric(query$foo) == 1) {
##D       # Do something
##D     }
##D     if (query[["bar"]] == "targetstring") {
##D       # Do something else
##D     }
##D 
##D     # Return a string with key-value pairs
##D     paste(names(query), query, sep = "=", collapse=", ")
##D   })
##D }
## End(Not run)




