library(datarobot)


### Name: DownloadPrimeCode
### Title: Download the code of DataRobot Prime model and save it to a
###   file.
### Aliases: DownloadPrimeCode

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   primeFiles <- ListPrimeFiles(projectId)
##D   primeFile <- primeFiles[[1]]
##D   primeFileId <- primeFile$id
##D   file <- file.path(tempdir(), "primeCode.py")
##D   DownloadPrimeCode(projectId, primeFileId, file)
## End(Not run)



