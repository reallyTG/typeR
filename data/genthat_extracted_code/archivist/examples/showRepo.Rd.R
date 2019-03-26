library(archivist)


### Name: showLocalRepo
### Title: View the List of Artifacts from the Repository
### Aliases: showLocalRepo showRemoteRepo

### ** Examples

## Not run: 
##D # objects preparation
##D 
##D showLocalRepo(method = "md5hashes", 
##D    repoDir = system.file("graphGallery", package = "archivist"))
##D showLocalRepo(method = "tags", 
##D    repoDir = system.file("graphGallery", package = "archivist"))
##D 
##D 
##D # Remote version
##D 
##D showRemoteRepo(method = "md5hashes", user = "pbiecek", repo = "archivist")
##D showRemoteRepo(method = "tags", user = "pbiecek", repo = "archivist", branch = "master")
##D 
##D # many archivist-like Repositories on one Remote repository
##D 
##D showRemoteRepo( user="MarcinKosinski", repo="Museum", branch="master",
##D                 subdir="ex1")
##D showRemoteRepo( user="MarcinKosinski", repo="Museum", branch="master",
##D                 subdir="ex2")
##D                 
##D ## Remote options
##D showRemoteRepo('archivist', 'pbiecek')
##D aoptions('user', 'pbiecek')
##D aoptions('repo', 'archivist')
##D loadFromRemoteRepo("ff575c261c", value = TRUE) -> iris123
##D 
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
##D 
## End(Not run)



