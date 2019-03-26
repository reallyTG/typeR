library(devtools)


### Name: source_gist
### Title: Run a script on gist
### Aliases: source_gist

### ** Examples

## Not run: 
##D # You can run gists given their id
##D source_gist(6872663)
##D source_gist("6872663")
##D 
##D # Or their html url
##D source_gist("https://gist.github.com/hadley/6872663")
##D source_gist("gist.github.com/hadley/6872663")
##D 
##D # It's highly recommend that you run source_gist with the optional
##D # sha1 argument - this will throw an error if the file has changed since
##D # you first ran it
##D source_gist(6872663, sha1 = "54f1db27e60")
##D # Wrong hash will result in error
##D source_gist(6872663, sha1 = "54f1db27e61")
##D 
##D #' # You can speficy a particular R file in the gist
##D source_gist(6872663, filename = "hi.r")
##D source_gist(6872663, filename = "hi.r", sha1 = "54f1db27e60")
## End(Not run)



