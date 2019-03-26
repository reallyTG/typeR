library(ff)


### Name: file.resize
### Title: Change size of move an existing file
### Aliases: file.resize file.move
### Keywords: IO data

### ** Examples

 x <- tempfile()
 newsize <- 23       # resize and size to 23 bytes.
 file.resize(x, newsize)
 file.info(x)$size == newsize
 ## Not run: 
##D    newsize <- 8*(2^30) # create new file and size to 8 GB.
##D    file.resize(x, newsize)
##D    file.info(x)$size == newsize
##D  
## End(Not run)
 y <- tempfile()
 file.move(x,y)
 file.remove(y)



