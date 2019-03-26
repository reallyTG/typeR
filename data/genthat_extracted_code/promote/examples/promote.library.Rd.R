library(promote)


### Name: promote.library
### Title: Import one or more libraries and add them to the promote model's
###   dependency list
### Aliases: promote.library
### Keywords: import

### ** Examples

## Not run: 
##D promote.library("MASS")
##D promote.library(c("wesanderson", "stringr"))
##D promote.library("hilaryparker/cats")
##D promote.library("cats", src="github", user="hilaryparker")
##D promote.library("my_public_package", install=FALSE)
##D promote.library("my_public_package", src="git", url="https://gitlab.com/userName/rpkg.git")
##D promote.library("my_proprietary_package", src="github", auth_token=<yourToken>) 
##D promote.library("testPkg", src="github", user="emessess", auth_token=<yourToken>) 
##D promote.library("priv_pkg", 
##D                 src="git", 
##D                 url="https://x-access-token:<PersonalAccessToken>ATgithub.com/username/rpkg.git")
##D promote.library("priv_pkg", 
##D                  src="git", 
##D                  url="https://x-access-token:<PersonalAccessToken>ATgitlab.com/username/rpkg.git", 
##D                  ref="stage")
##D promote.library("my_package", src="github", auth_token=<yourToken> subdir="/pathToSubdir/")  
## End(Not run)



