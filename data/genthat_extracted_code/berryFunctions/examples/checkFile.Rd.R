library(berryFunctions)


### Name: checkFile
### Title: check file existence
### Aliases: checkFile
### Keywords: file

### ** Examples

is.error( checkFile("FileThatDoesntExist.txt")  )
checkFile("FileThatDoesntExist.txt", warnonly=TRUE)
checkFile("FileThatDoesntExist.txt", warnonly=TRUE, trace=FALSE)

## Not run: 
##D ## Excluded from CRAN checks because of file creation
##D # Vectorized:
##D file.create("DummyFile2.txt")
##D checkFile(paste0("DummyFile",1:3,".txt"), warnonly=TRUE)
##D checkFile(paste0("DummyFile",1:3,".txt") )
##D file.remove("DummyFile2.txt")
##D 
##D compareFiles("dummy.nonexist", "dummy2.nonexist")
##D checkFile("dummy.nonexist")
## End(Not run)

dingo <- function(k="brute.nonexist", trace=TRUE)
         checkFile(k, warnonly=TRUE, trace=trace)
dingo()
dingo("dummy.nonexist")

upper <- function(h, ...) dingo(c(h, "dumbo.nonexist"), ...)
upper("dumbo2.nonexist")
upper(paste0("dumbo",2:8,".nonexist"))
upper(paste0("dumbo",2:8,".nonexist"), trace=FALSE)





