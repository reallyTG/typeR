library(archivist)


### Name: getTagsLocal
### Title: Return Tags Corresponding to md5hash
### Aliases: getTagsLocal getTagsRemote

### ** Examples


### Local version
## Not run: 
##D ## EXAMPLE with pipe operator %a%
##D 
##D # Creating empty repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo( exampleRepoDir )
##D 
##D library(dplyr)
##D data(mtcars)
##D setLocalRepo(repoDir = exampleRepoDir)
##D hash <- mtcars %a% 
##D  group_by(cyl, am) %a%
##D    select(mpg, cyl, wt, am) %a%
##D      summarise(avgmpg = mean(mpg), avgwt = mean(wt)) %a%
##D        filter(avgmpg > 20) %a%
##D        saveToRepo( exampleRepoDir )
##D        
##D showLocalRepo(exampleRepoDir)
##D showLocalRepo(exampleRepoDir, method = "tags")
##D 
##D # We search for a Tag with default "name" regular expression corresponding to 
##D # hash md5hash.
##D getTagsLocal( md5hash = hash, exampleRepoDir )
##D 
##D # Deleting example respository
##D deleteLocalRepo( exampleRepoDir, TRUE) 
##D rm( exampleRepoDir ) 
##D 
##D ## EXAMPLE with data iris
##D exampleRepoDir <- tempfile()
##D createLocalRepo( exampleRepoDir )
##D 
##D data(iris)
##D saveToRepo(iris, repoDir = exampleRepoDir )
##D showLocalRepo(exampleRepoDir)
##D showLocalRepo(exampleRepoDir, method = "tags")
##D 
##D # We can notice that there is only one md5hash 
##D # (and second for archiveSessionInfo) in repo so we will use it
##D hash <- showLocalRepo(exampleRepoDir)[1,1]
##D 
##D # We search for a Tag with "varname" regular expression corresponding to 
##D # hash md5hash.
##D getTagsLocal( md5hash = hash, exampleRepoDir, tag = "varname" ) 
##D # There are 5 different Tags with "varname" regular expression
##D 
##D # We needn't use the whole expression "varname". We may use its abbreviation
##D # and get the same result.
##D getTagsLocal( md5hash = hash, exampleRepoDir, tag = "varna" ) 
##D 
##D deleteLocalRepo( exampleRepoDir, TRUE) 
##D rm( exampleRepoDir ) 
##D 
##D ### Remote version
##D ## EXAMPLE: pbiecek archivist repository on GitHub
##D 
##D showRemoteRepo(user="pbiecek", repo="archivist")
##D # We search for a Tag with default "name" regular expression corresponding to 
##D # "cd6557c6163a6f9800f308f343e75e72" md5hash.
##D getTagsRemote( "cd6557c6163a6f9800f308f343e75e72",
##D                 user="pbiecek", repo="archivist")
##D                 
##D ## EXAMPLE: many archivist-like Repositories on one Github repository
##D # We search for a Tag with default "name" regular expression corresponding to 
##D # "ff575c261c949d073b2895b05d1097c3" md5hash.
##D getTagsRemote("ff575c261c949d073b2895b05d1097c3", user="MarcinKosinski",
##D                repo="Museum", branch="master", subdir="ex1")
## End(Not run)               




