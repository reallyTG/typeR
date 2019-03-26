library(WikipediaR)


### Name: backLinks
### Title: lists pages that link to the Wikipedia page
### Aliases: backLinks

### ** Examples

## Not run: 
##D #' # a simple example
##D backLinks("Louis Pasteur") 
##D 
##D backLinks.Baschet <- backLinks(page ="Cristal Baschet", domain ="fr")
##D table(backLinks.Baschet$backLinks$nscat)
##D 
##D ## example with no back link
##D backLinks(page = 976, domain = "en" )
##D 
##D # with a page that not exist (at the moment of the redaction of this help page)
##D backLinks("zzzzz")
## End(Not run)



