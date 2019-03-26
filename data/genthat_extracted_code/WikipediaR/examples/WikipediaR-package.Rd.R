library(WikipediaR)


### Name: WikipediaR-package
### Title: R-Based Wikipedia Client
### Aliases: WikipediaR-package WikipediaR
### Keywords: package

### ** Examples

 ## Not run: 
##D ## wikipedia links and external links that are present 
##D links("Louis Pasteur") # default domain : en
##D ## if the specified page needs to be redirected
##D links(page ="Structure baschet",domain = "fr")
##D # warning message
##D 
##D ## wikipedia pages that link to the page about Luxor Temple
##D bl.Luxor <- backLinks(domain ="en", page = "Luxor Temple")
##D # in how many main pages and discussions this page is linked ?
##D table(bl.Luxor$backLinks$nscat)
##D 
##D ## contributions on a page specified by its page ID
##D contrib.5636 <- contribs(5636, domain = "en")
##D # get the last non anonymous contributor
##D last.contrib.5636 <- contrib.5636$contribs[which(contrib.5636$contribs$userid!=0),]$user[1]
##D last.contrib.5636
##D 
##D ## number of contributions for this user
##D nrow(userContribs(user.name = last.contrib.5636, domain = "en")$contribs)
##D ## and informations about this user
##D userInfo(user.name = last.contrib.5636, domain = "en",
##D   usprop="groups|rights|editcount|gender" )
##D   
## End(Not run)



