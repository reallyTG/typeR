library(archivist)


### Name: aoptions
### Title: Default Options for Archivist
### Aliases: aoptions

### ** Examples

## Not run: 
##D # data.frame object
##D # data(iris)
##D 
##D 
##D ## EXAMPLE 1 : SET default local repository using aoptions() function.
##D 
##D # creating example repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo(exampleRepoDir)
##D 
##D # "repodDir" parameter in each archivist function will be default and set to exampleRepoDir.
##D aoptions(key = "repoDir", value = exampleRepoDir)
##D 
##D data(iris)
##D data(swiss)
##D # From this moment repoDir parameter may be ommitted in the following functions
##D saveToLocalRepo(iris)
##D saveToLocalRepo(swiss) 
##D showLocalRepo()
##D showLocalRepo(method = "tags")
##D zipLocalRepo()
##D file.remove(file.path(getwd(), "repository.zip"))
##D iris2 <- loadFromLocalRepo( "ff575c2" , value = TRUE)
##D searchInLocalRepo("name:i", fixed = F)
##D getTagsLocal("ff575c261c949d073b2895b05d1097c3")
##D rmFromLocalRepo("4c43f")
##D showLocalRepo()
##D summaryLocalRepo()
##D 
##D # REMEMBER that in deleteRepo you MUST specify repoDir parameter!
##D # deleteLocalRepo doesn't take setLocalRepo's settings into consideration
##D deleteLocalRepo( exampleRepoDir, deleteRoot = TRUE)
##D rm( exampleRepoDir )
##D 
##D ## EXAMPLE 2 : SET default Github repository using aoptions() function.
##D aoptions(key = "user", value = "pbiecek")
##D aoptions(key = "repo", value = "archivist")
##D 
##D # From this moment user and repo parameters may be ommitted in the following functions:
##D showRemoteRepo() 
##D loadFromRemoteRepo( "ff575c261c949d073b2895b05d1097c3")
##D this <- loadFromRemoteRepo( "ff", value = T)
##D file.remove(file.path(getwd(), "repository.zip")) # We can remove this zip file
##D searchInRemoteRepo( "name:", fixed= FALSE)
##D getTagsGithub("ff575c261c949d073b2895b05d1097c3")
##D summaryRemoteRepo( )
##D searchInRemoteRepo( pattern=c("varname:Sepal.Width", "class:lm", "name:myplot123"), 
##D                          intersect = FALSE ) 
##D ## EXAMPLE 3 : SET default Github repository using aoptions() function.
##D showRemoteRepo('Museum', 'MarcinKosinski', subdir = 'ex1')
##D aoptions('repo', 'Museum')
##D aoptions('user', 'MarcinKosinski')
##D aoptions('subdir', 'ex1')
##D aoptions('branch', 'master')
##D showRemoteRepo()
##D showRemoteRepo(subdir = 'ex2')
##D 
##D aoptions('subdir')
##D 
##D ## EXAMPLE 4 : SET sha256 as a hasing algorithm
##D aoptions("hashFunction", value = "sha256")
##D exampleRepoDir <- tempfile()
##D createLocalRepo(exampleRepoDir)
##D aoptions(key = "repoDir", value = exampleRepoDir)
##D 
##D data(iris)
##D saveToLocalRepo(iris)
##D getTagsLocal(digest::digest(iris, algo = "sha256"))
##D 
## End(Not run)




