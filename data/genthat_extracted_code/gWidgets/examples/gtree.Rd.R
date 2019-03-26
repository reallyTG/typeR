library(gWidgets)


### Name: gtree
### Title: Constructor for widget to display heirarchical dta
### Aliases: gtree
### Keywords: interface

### ** Examples

## Not run: 
##D  ## function to find offspring
##D  offspring <- function(path, offspring.data=NULL) {
##D          if(length(path) > 0) 
##D            directory <- paste(getwd(), .Platform$file.sep,
##D                               paste(path,collapse=.Platform$file.sep),
##D                               sep="")
##D          else
##D            directory <- getwd()
##D 
##D          files <- file.info(dir(path=directory, full.names=TRUE))[,c(1,2,3)]
##D          files <- data.frame(filename=dir(path=directory),
##D                              isdir=files[,2],
##D                              size=as.integer(files[,1]),
##D                              mode=as.character(files[,3]),
##D                              stringsAsFactors=FALSE)
##D          return(files)
##D  }
##D  hasOffspring <- function(children,offspring.data=NULL, ...) {
##D    return(children$isdir)
##D  }
##D  icon.FUN <- function(children,offspring.data=NULL, ...) {
##D    x <- rep("file", length=nrow(children))
##D    x[children$isdir] <- "directory"
##D    return(x)
##D   }
##D   ## shows isdir directory, as hasOffspring is specified
##D   w <- gwindow("test with isdir showing")
##D   gtree(offspring, hasOffspring, icon.FUN = icon.FUN, container=w)
##D 
##D   ## does not show isdir directory, as hasOffspring=NULL and
##D   ## second column is a logical
##D   w <- gwindow("tree test no dir column")
##D   tr <- gtree(offspring, hasOffspring=NULL, icon.FUN = icon.FUN, container=w)
##D 
##D   ## Show a fixed list using a dynamic tree
##D l <- list(a=list(
##D             aa=1,
##D             ab=2,
##D             ac=list(ac1=1)
##D             ),
##D           b=list(
##D             ba=list(
##D               baa=1,
##D               bab=list(
##D                 baba=1
##D                 )
##D               )
##D             ))
##D 
##D offspring <- function(path, ...) {
##D   print(path)
##D   ll <- l
##D   if(length(path) > 0) {
##D     for(i in path)
##D       ll <- ll[[i]]
##D   }
##D   out <- data.frame(name=names(ll),
##D                     hasOffspring=!sapply(ll, is.atomic),
##D                     value=as.character(sapply(ll, function(i) ifelse(is.atomic(i), i, ""))),
##D                     stringsAsFactors=FALSE)
##D   out
##D }
##D 
##D w <- gwindow("Tree from list")
##D tr <- gtree(offspring=offspring, container=w)
##D 
##D addHandlerDoubleclick(tr, handler=function(h,...) {
##D   print(svalue(h$obj))		# the key
##D   print(h$obj[])		# vector of keys
##D })
##D 
##D 
## End(Not run)



