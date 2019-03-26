library(archivist)


### Name: copyLocalRepo
### Title: Copy an Existing Repository into Another Repository
### Aliases: copyLocalRepo copyRemoteRepo

### ** Examples

## Not run: 
##D 
##D ## Using archivist remote Repository to copy artifacts
##D # creating example Repository
##D  
##D exampleRepoDir <- tempfile()
##D createLocalRepo( exampleRepoDir )
##D 
##D # Searching for md5hashes of artifacts (without data related to them)
##D # in the archivist remote  Repository
##D hashes <- searchInRemoteRepo( pattern="name", user="pbiecek", repo="archivist", fixed=FALSE )
##D 
##D # Copying selected artifacts from archivist Remote  Repository into exampleRepoDir Repository
##D 
##D copyRemoteRepo( repoTo = exampleRepoDir , md5hashes= hashes, user="pbiecek", repo="archivist" )
##D 
##D # See how the gallery folder in our exampleRepoDir Repository
##D # with copies of artifacts from archivist Remote  Repository looks like
##D list.files( path = file.path( exampleRepoDir, "gallery" ) )
##D 
##D # See how the backpack database in our exampleRepoDir Repository looks like
##D showLocalRepo( repoDir = exampleRepoDir )
##D 
##D # removing an example Repository
##D 
##D deleteLocalRepo( exampleRepoDir, deleteRoot=TRUE )
##D 
##D rm( exampleRepoDir )
##D 
##D # many archivist-like Repositories on one Remote repository
##D 
##D dir <- paste0(getwd(), "/ex1")
##D createLocalRepo( dir )
##D copyRemoteRepo( repoTo = dir , md5hashes = "ff575c261c949d073b2895b05d1097c3",
##D                 user="MarcinKosinski", repo="Museum",
##D                 branch="master", subdir="ex2")
##D                 
##D # Check if the copied artifact is on our dir Repository
##D 
##D showLocalRepo( repoDir = dir) # It is in backpack database indeed
##D list.files( path = file.path( dir, "gallery" ) ) # it is also in gallery folder
##D 
##D # removing an example Repository
##D deleteLocalRepo( dir, TRUE)
##D 
##D rm(dir)
##D 
##D ## Using graphGallery Repository attached to the archivist package to copy artifacts
##D 
##D # creating example Repository
##D 
##D exampleRepoDir <- tempfile()
##D createLocalRepo( exampleRepoDir )
##D 
##D # Searching for md5hashes of artifacts (without data related to them)
##D # in the graphGallery  Repository
##D archivistRepo <- system.file( "graphGallery", package = "archivist")
##D # You may use: 
##D # hashes <- unique(showLocalRepo(repoDir)[,1]) 
##D # to extract all artifacts from repository
##D hashes <- searchInLocalRepo( pattern="name",
##D                              repoDir =  archivistRepo,
##D                              fixed=FALSE )
##D 
##D # Copying selected artifacts from archivist Remote  Repository into exampleRepoDir Repository
##D 
##D copyLocalRepo( repoFrom = archivistRepo, repoTo = exampleRepoDir , md5hashes= hashes )
##D 
##D # See how the backpack database in our exampleRepoDir Repository looks like
##D showLocalRepo( repoDir = exampleRepoDir )
##D 
##D # removing an example Repository
##D 
##D deleteLocalRepo( exampleRepoDir, deleteRoot=TRUE )
##D 
##D rm( exampleRepoDir )
##D rm( archivistRepo )
##D 
## End(Not run)





