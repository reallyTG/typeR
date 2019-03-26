library(MplusAutomation)


### Name: .cleanHashData
### Title: Clean data and calculate the md5 hash
### Aliases: .cleanHashData .hashifyFile
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D ## basic example
##D MplusAutomation:::.cleanHashData(mtcars)
##D 
##D ## has changes when data changes
##D MplusAutomation:::.cleanHashData(mtcars[-15,])
##D 
##D ## example on a list (e.g., for multiply imputed data)
##D 
##D MplusAutomation:::.cleanHashData(
##D  list(
##D    data.frame(a = 1:4),
##D    data.frame(a = c(2, 2, 3, 4))),
##D   imputed = TRUE)
##D 
## End(Not run)
MplusAutomation:::.hashifyFile("testit.dat", "abc")



