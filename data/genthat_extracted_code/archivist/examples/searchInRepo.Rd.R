library(archivist)


### Name: searchInLocalRepo
### Title: Search for an Artifact in the Repository Using Tags
### Aliases: searchInLocalRepo searchInRemoteRepo multiSearchInLocalRepo
###   multiSearchInRemoteRepo

### ** Examples

## Not run: 
##D # objects preparation
##D 
##D   showLocalRepo(method = "md5hashes", 
##D      repoDir = system.file("graphGallery", package = "archivist"))
##D   showLocalRepo(method = "tags", 
##D      repoDir = system.file("graphGallery", package = "archivist"))
##D   
##D   # Tag search, fixed version
##D   searchInLocalRepo( "class:ggplot", repoDir = exampleRepoDir )
##D   searchInLocalRepo( "name:", repoDir = exampleRepoDir )
##D   # Tag search, regex version
##D   searchInLocalRepo( "class", repoDir = exampleRepoDir, fixed = FALSE )
##D   
##D   # Github version
##D   # check the state of the Repository
##D   summaryRemoteRepo( user="pbiecek", repo="archivist" )
##D   showRemoteRepo( user="pbiecek", repo="archivist" )
##D   showRemoteRepo( user="pbiecek", repo="archivist", method = "tags" )
##D   # Tag search, fixed version
##D   searchInRemoteRepo( "varname:Sepal.Width", user="pbiecek", repo="archivist" )
##D   searchInRemoteRepo( "class:lm", user="pbiecek", repo="archivist", branch="master" )
##D   searchInRemoteRepo( "name:myplot123", user="pbiecek", repo="archivist" )
##D   
##D   # Tag search, regex version
##D   searchInRemoteRepo( "class", user="pbiecek", repo="archivist",  fixed = FALSE )
##D   searchInRemoteRepo( "name", user="pbiecek", repo="archivist", fixed = FALSE )
##D   
##D   # also on Github
##D   
##D   # Remeber to set dateTo parameter to actual date because sometimes we update datasets.
##D   searchInRemoteRepo( pattern = list( dateFrom = "2015-10-01", dateTo = "2015-11-30" ), 
##D                       user="pbiecek", repo="archivist", branch="master" )
##D   
##D   
##D   # many archivist-like Repositories on one Remote repository
##D   
##D   searchInRemoteRepo( pattern = "name", user="MarcinKosinski", repo="Museum", 
##D   branch="master", subdir="ex1", fixed = FALSE )
##D 
##D   searchInRemoteRepo( pattern = "name", user="MarcinKosinski", repo="Museum", 
##D                    branch="master", subdir="ex2", fixed = FALSE )
##D  
##D  # multi versions
##D  searchInRemoteRepo( pattern=c("varname:Sepal.Width", "class:lm", "name:myplot123"), 
##D                          user="pbiecek", repo="archivist", intersect = FALSE )
##D   
## End(Not run)



