library(KoNLP)


### Name: backupUsrDic
### Title: use for backup current dic_user.txt Utility function for backup
###   dic_user.txt file to backup directory.
### Aliases: backupUsrDic

### ** Examples

## Not run: 
##D ## This codes can not be run if you don't have encoding system 
##D ## which can en/decode Hangul(ex) CP949, EUC-KR, UTF-8). 
##D dicpath <- file.path(system.file(package="Sejong"), "dics", "handic.zip")
##D conn <- unz(dicpath, file.path("data","kE","dic_user2.txt"))
##D newdic <- read.csv(conn, sep="\t", header=FALSE, fileEncoding="UTF-8", stringsAsFactors=FALSE)
##D mergeUserDic(newdic)
##D ## backup merged new dictionary
##D backupUsrDic(ask=FALSE)
##D ## restore from backup directory
##D restoreUsrDic(ask=FALSE)
##D ## reloading new dictionary
##D reloadAllDic()
## End(Not run)



