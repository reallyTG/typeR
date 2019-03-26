library(RSauceLabs)


### Name: getStoredFiles
### Title: Get Stored Files
### Aliases: getStoredFiles

### ** Examples

## Not run: 
##D myAcc <- account()
##D # create a temporary file
##D myTempFile <- file.path(tempdir(), "notsecret.html")
##D write("SUPER SECRET STUFF", myTempFile)
##D # check stored files
##D myStoredFiles <- getStoredFiles(myAcc)
##D 
##D # upload new file
##D res <- uploadFile(myAcc, file = myTempFile)
##D #> res
##D #$username
##D #[1] "seleniumPipes"
##D #
##D #$size
##D #[1] 19
##D #
##D #$md5
##D #[1] "e459fe3803b78d64cc5c2998804909a9"
##D #
##D #$filename
##D #[1] "notsecret.html"
##D 
##D #> digest::digest(file = myTempFile, algo = "md5")
##D #[1] "e459fe3803b78d64cc5c2998804909a9"
##D 
##D myStoredFiles <- getStoredFiles(myAcc)
##D 
##D #> rbindlist(myStoredFiles$files)
##D #size      mtime           name                              md5
##D #1:   19 1472401537 notsecret.html e459fe3803b78d64cc5c2998804909a9
##D #2:   14 1472350499      testDoc.R adfc8afc373f0b3fd6f93c3891bdd11b
##D 
## End(Not run)



