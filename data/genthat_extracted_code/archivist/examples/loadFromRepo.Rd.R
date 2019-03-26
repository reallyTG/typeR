library(archivist)


### Name: loadFromLocalRepo
### Title: Load Artifact Given as a md5hash from a Repository
### Aliases: loadFromLocalRepo loadFromRemoteRepo

### ** Examples


## Not run: 
##D # objects preparation
##D 
##D #' exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D data(iris)
##D saveToLocalRepo(iris, repoDir=exampleRepoDir, archiveSessionInfo = TRUE)
##D showLocalRepo(method = "md5hashes", repoDir = exampleRepoDir)
##D showLocalRepo(method = "tags", repoDir = exampleRepoDir)
##D 
##D loadFromLocalRepo(md5hash = '7f3453331910e3f321ef97d87adb5bad',
##D   repoDir = system.file("graphGallery", package = "archivist"), value = TRUE) -> pl
##D deleteLocalRepo(exampleRepoDir, TRUE)
##D rm(exampleRepoDir)
##D 
##D 
##D #
##D #Remote Version
##D #
##D 
##D # check the state of the Repository
##D summaryRemoteRepo( user="pbiecek", repo="archivist" )
##D showRemoteRepo( user="pbiecek", repo="archivist" )
##D showRemoteRepo( user="pbiecek", repo="archivist", method = "tags" )
##D 
##D rm( model )
##D rm( myplot123 )
##D rm( qda1 )
##D (VARmd5hash <- searchInRemoteRepo( "varname:Sepal.Width", 
##D                    user="pbiecek", repo="archivist" ))
##D (NAMEmd5hash <- searchInRemoteRepo( "name:qda1", 
##D                    user="pbiecek", repo="archivist", branch="master" ))
##D (CLASSmd5hash <- searchInRemoteRepo( "class:ggplot", 
##D                    user="pbiecek", repo="archivist", branch="master" ))
##D 
##D 
##D loadFromRemoteRepo( "ff575c261c", user="pbiecek", repo="archivist")
##D NewObjects <- loadFromRemoteRepo( NAMEmd5hash, user="pbiecek", repo="archivist", value = TRUE )
##D loadFromRemoteRepo( CLASSmd5hash, user="pbiecek", repo="archivist")
##D 
##D 
##D ## Loading artifacts from the repository which is built in the archivist package 
##D ## and saving them on the example repository
##D 
##D # Creating an example Repository - on which artifacts loaded from the
##D # archivist package repository will be saved
##D exampleRepoDir <- tempfile()
##D createLocalRepo(repoDir = exampleRepoDir)
##D 
##D # Directory of the archivist package repository
##D repo_archivist <- system.file("graphGallery", package = "archivist") 
##D 
##D # We are checking what kind of objects
##D # are stored in the archivist package repository
##D summaryLocalRepo(repoDir = repo_archivist)
##D 
##D # Let's say that we are interested in 
##D # an artifact of class ggplot.
##D GGPLOTmd5hash <- searchInLocalRepo(pattern = "class:ggplot",
##D                                    repoDir = repo_archivist) 
##D # There are eight of them.
##D # We load the first one by its value (parameter value = TRUE)
##D # and assign it to the p variable.
##D p <- loadFromLocalRepo(GGPLOTmd5hash[1], repoDir = repo_archivist,
##D                        value = TRUE)
##D 
##D # Finally, we may save the artifact on the example Repository.
##D # Note that md5hash is different from the one which is stored in
##D # the archivist package repository.
##D saveToRepo(p, repoDir = exampleRepoDir) 
##D 
##D # Making sure that the artifact is stored on the example repository
##D showLocalRepo(repoDir = exampleRepoDir, method = "tags")
##D 
##D # removing an example Repository
##D 
##D deleteLocalRepo( exampleRepoDir, TRUE)
##D 
##D rm( exampleRepoDir )
##D 
##D # many archivist-like Repositories on one Remote repository
##D 
##D loadFromRemoteRepo( "ff575c261c949d073b2895b05d1097c3", 
##D user="MarcinKosinski", repo="Museum", branch="master", subdir="ex2")
##D 
##D 
##D loadFromRemoteRepo( "ff575c261c949d073b2895b05d1097c3", 
##D                     user="MarcinKosinski", repo="Museum", branch="master",
##D                     subdir="ex1")
##D                     
##D #github
##D loadFromRemoteRepo(md5hash = "08dc0b66975cded92b5cd8291ebdc955", 
##D                repo = "graphGallery", user = "pbiecek", 
##D                repoType = "github", value = TRUE)
##D            
##D #git
##D loadFromRemoteRepo(md5hash = "08dc0b66975cded92b5cd8291ebdc955", 
##D                repo = "graphGalleryGit", user = "pbiecek", 
##D                repoType = "bitbucket", value = TRUE)
##D 
##D # mercurial               
##D loadFromRemoteRepo(md5hash = "08dc0b66975cded92b5cd8291ebdc955", 
##D                repo = "graphGalleryM", user = "pbiecek", 
##D                repoType = "bitbucket", value = TRUE)
## End(Not run)



