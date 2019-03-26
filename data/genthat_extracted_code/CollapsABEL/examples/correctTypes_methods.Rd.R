library(CollapsABEL)


### Name: correctTypes_methods
### Title: Convert columns of a data frame to certain types
### Aliases: correctTypes correctTypes_methods

### ** Examples

## Not run: 
##D dat = randNormDat(3, 3)
##D dat[, 2] = as.character(dat$V2)
##D dat1 = correctTypes(dat, types = rep("numeric", 3))
##D all(colClasses(dat1) == rep("numeric", 3))
##D dat2 = correctTypes(dat, 2, "numeric")
##D all(colClasses(dat2) == rep("numeric", 3))
## End(Not run)



