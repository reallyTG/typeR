library(archivist)


### Name: setLocalRepo
### Title: Set Repository's Global Path
### Aliases: setLocalRepo setPostgresRepo setRemoteRepo

### ** Examples

## Not run: 
##D ## Local version
##D exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D setLocalRepo(exampleRepoDir) 
##D 
##D data(iris)
##D data(swiss)
##D 
##D # From this moment repoDir parameter may be ommitted in the following functions
##D saveToRepo(iris)
##D saveToRepo(swiss) 
##D showLocalRepo()
##D showLocalRepo(method = "tags")
##D iris2 <- loadFromLocalRepo( "ff575c2" , value = TRUE)
##D searchInLocalRepo("name:i", fixed = FALSE)
##D getTagsLocal("ff575c261c949d073b2895b05d1097c3")
##D rmFromLocalRepo("4c43f")
##D showLocalRepo()
##D summaryLocalRepo()
##D 
##D # REMEMBER that in deleteLocalRepo you MUST specify repoDir parameter!
##D # deleteRepo doesn't take setLocalRepo's settings into consideration
##D deleteLocalRepo( exampleRepoDir, deleteRoot=TRUE)
##D rm( exampleRepoDir )
##D 
##D ## Github version
##D setRemoteRepo( user="MarcinKosinski", repo="Museum", branch="master",
##D                subdir="ex1" )
##D                
##D # From this moment user, repo, branch, subdir parameters may be ommitted
##D # in the following functions:
##D showRemoteRepo()
##D loadFromRemoteRepo( "ff575c261c949d073b2895b05d1097c3")
##D this <- loadFromRemoteRepo( "ff", value = TRUE)
##D zipRemoteRepo()
##D file.remove(file.path(getwd(), "repository.zip")) # We can remove this zip file
##D searchInRemoteRepo( "name:", fixed= FALSE)
##D getTagsRemote("ff575c261c949d073b2895b05d1097c3")
##D summaryRemoteRepo( )
##D 
##D # To use multisearchInRemoteRepo we should use repository with more than one artifact. 
##D setRemoteRepo( user="pbiecek", repo="archivist"  )
##D 
##D # From this moment user and repo parameters may be ommitted in the following functions
##D showRemoteRepo()
##D searchInRemoteRepo( pattern=c("varname:Sepal.Width", "class:lm", "name:myplot123"), 
##D                          intersect = FALSE )
## End(Not run)



