library(ff)


### Name: splitPathFile
### Title: Analyze pathfile-strings
### Aliases: standardPathFile splitPathFile unsplitPathFile tempPathFile
###   fftempfile
### Keywords: file

### ** Examples

  pathfile <- c("", ".", "/.", "./", "./.", "/"
  , "a", "a/", "/a", "a/a", "./a", "a/.", "c:/a/b/c", "c:/a/b/c/"
  , "..", "../", "/..", "../..", "//", "\\\\a\\", "\\\\a/"
  , "\\\\a/b", "\\\\a/b/", "~", "~/", "~/a", "~/a/")
  splitted <- splitPathFile(pathfile)
  restored <- unsplitPathFile(splitted)
  stopifnot(all(gsub("\\\\","/",restored)==gsub("\\\\","/",pathfile)))

  dirnam <- dirname(pathfile)
  basnam <- basename(pathfile)

  db  <- file.path(dirnam,basnam)
  ident = gsub("\\\\","/",db) == gsub("\\\\","/",pathfile)
  sum(!ident)

  do.call("data.frame", c(list(ident=ident, pathfile=pathfile
   , dirnam=dirnam, basnam=basnam), splitted))

  ## Not run: 
##D     message("show the difference between tempfile and fftempfile")
##D     do.call("data.frame", c(list(ident=ident, pathfile=pathfile, dirnam=dirnam, basnam=basnam)
##D , splitted, list(filename=tempPathFile(splitted), fftempfile=fftempfile(pathfile))))
##D 
##D     message("for a single string splitPathFile is slower, 
##D for vectors of strings it scales much better than dirname+basename")
##D 
##D     system.time(for (i in 1:1000){
##D       d <- dirname(pathfile)
##D       b <- basename(pathfile)
##D     })
##D     system.time(for (i in 1:1000){
##D       s <- splitPathFile(pathfile)
##D     })
##D 
##D     len <- c(1,10,100,1000)
##D     timings <- matrix(0, 2, length(len), dimnames=list(c("dir.base.name", "splitPathFile"), len))
##D     for (j in seq(along=len)){
##D       l <- len[j]
##D       r <- 10000 / l
##D       x <- rep("\\\\a/b/", l)
##D       timings[1,j] <- system.time(for (i in 1:r){
##D           d <- dirname(x)
##D           b <- basename(x)
##D         })[3]
##D       timings[2,j] <- system.time(for (i in 1:r){
##D           s <- splitPathFile(x)
##D         })[3]
##D     }
##D     timings
##D   
## End(Not run)



