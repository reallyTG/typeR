library(DescTools)


### Name: SplitPath
### Title: Split Path In Drive, Path, Filename
### Aliases: SplitPath
### Keywords: manip

### ** Examples

## Not run: 
##D  # Windows-specific example
##D path <- "C:/Documents/Projects/Import/eyestudy.dta"
##D SplitPath(path)
##D 
##D path <- "C:/Documents/Projects/Import/"
##D SplitPath(path)
##D 
##D path <- "C:/Documents/Projects/Import"
##D SplitPath(path)  # last entry will be taken as filename
##D SplitPath(path, last.is.file=FALSE)
## End(Not run)



