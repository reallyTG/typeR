library(lxb)


### Name: readLxb
### Title: Read LXB files
### Aliases: readLxb
### Keywords: file

### ** Examples

## Not run: 
##D ## Read file 'name.lxb' from current directory and include all
##D ## information about the LXB file
##D x <- readLxb('name.lxb', filter=FALSE, text=TRUE)
##D dim(x$data)
##D names(x$text)
##D 
##D ## Read all LXB files from current directory
##D xs <- readLxb('*.lxb')
##D length(xs)
##D dim(xs[[1]])
##D 
##D ## If the LXB files end in a letter and digit, then this can be used to
##D ## index 'xs', e.g. to inspect the first few rows of well "C10", type:
##D head(xs$C10)
## End(Not run)



