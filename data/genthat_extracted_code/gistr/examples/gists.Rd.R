library(gistr)


### Name: gists
### Title: List gists
### Aliases: gists

### ** Examples

## Not run: 
##D # Public gists
##D gists()
##D gists(per_page=2)
##D gists(page=3)
##D # Public gists created since X time
##D gists(since='2014-05-26T00:00:00Z')
##D # Your public gists
##D gists('minepublic')
##D gists('minepublic', per_page=2)
##D # Your private and public gists
##D gists('mineall')
##D # Your starred gists
##D gists('starred')
##D # pass in curl options
##D gists(per_page=1, config=verbose())
##D gists(per_page=1, config=timeout(seconds = 0.5))
## End(Not run)



