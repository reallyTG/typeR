library(DescTools)


### Name: FileOpenCmd
### Title: Get Path of a Data File to Be Opened
### Aliases: FileOpenCmd
### Keywords: manip

### ** Examples

## Not run: 
##D # choose a file
##D fn <- FileOpenCmd()
##D print(gettextf("You chose the file: %s ", fn))
##D 
##D # the path and filename can as well be nested in a command,
##D #   done here to build a read.table command that can be well inserted into the code:
##D FileOpenCmd(fmt="d.%fname% <- read.table(file = \"%path%%fname%.%fxt%\",
##D   header = TRUE, sep = \";\", na.strings = c(\"NA\",\"NULL\"), strip.white = TRUE)")
##D 
##D # go to your editor and paste...
## End(Not run)



