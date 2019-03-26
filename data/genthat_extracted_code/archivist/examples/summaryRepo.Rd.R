library(archivist)


### Name: summaryLocalRepo
### Title: View the Summary of the Repository
### Aliases: summaryLocalRepo summaryRemoteRepo

### ** Examples

## Not run: 
##D 
##D showLocalRepo(repoDir = system.file("graphGallery", package = "archivist"))
##D #
##D # Remote version
##D #
##D  
##D x <- summaryRemoteRepo( user="pbiecek", repo="archivist")
##D print( x )
##D 
##D # many archivist-like Repositories on one Remote repository
##D   
##D summaryRemoteRepo(user="MarcinKosinski", repo="Museum", 
##D branch="master", subdir="ex2" )
##D 
## End(Not run)



