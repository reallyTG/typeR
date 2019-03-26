library(surveillance)


### Name: correct53to52-deprecated
### Title: Data Correction from 53 to 52 weeks
### Aliases: correct53to52
### Keywords: utilities

### ** Examples

## Not run: 
##D #This calls correct53to52 automatically
##D obj <- readData("k1",week53to52=TRUE)
##D correct53to52(obj) # first entry is the first week of the year
##D 
##D obj <- readData("n1",week53to52=FALSE)
##D correct53to52(obj, firstweek = 5) # now it's assumed that the fifth
##D                                   # entry is the first week of the year
## End(Not run)



