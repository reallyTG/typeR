library(gWidgets)


### Name: gtable
### Title: Constructor for widget to display tabular data
### Aliases: gtable
### Keywords: interface

### ** Examples

## Not run: 
##D   ## example to select CRAN mirror
##D   m <- getCRANmirrors()[,c(1,4)]
##D   setCRAN <- function(URL) { ## see chooseCRANmirror
##D     repos = getOption("repos")
##D     repos["CRAN"] <- gsub("/$", "", URL)
##D     options(repos=repos)
##D   }
##D   w <- gwindow("gtable example",width=400)
##D   gp <- ggroup(horizontal=FALSE, container=w)
##D   tab <- gtable(m, chosencol = 2, container=gp, expand=TRUE,
##D        handler = function(h,...) setCRAN(svalue(h$obj)))
##D   bg <- ggroup(container=gp)
##D   addSpring(bg)
##D   gbutton("dismiss", container=bg, handler = function(h,...) dispose(w))
##D 
##D 
##D   ## an example with icons.
##D   ## Select variables from a data frame
##D 
##D 
##D   ## find icons by class
##D   icon.FUN <- function(items) {
##D     dfName <- svalue(cb)
##D     df <- try(get(dfName, envir=.GlobalEnv), silent=TRUE)
##D     if(inherits(df,"try-error"))
##D       return(rep(NULL,dim(items)[1]))
##D     if(is.data.frame(items))
##D       items <- items[,1, drop=TRUE]
##D     sapply(items, function(i) {
##D       class(df[,i])[1]
##D     })
##D   }
##D   ## list data frames in an environment
##D   lsDF <- function(envir=.GlobalEnv) {
##D     varNames <- ls(envir=envir)
##D     dfs <- sapply(varNames, function(i) inherits(get(i,envir=envir),"data.frame"))
##D     varNames[dfs]
##D   }
##D   ## set up GUI
##D   w <- gwindow("Select variables",width=250)
##D   g <- ggroup(horizontal=FALSE, container=w)
##D   l <- glabel("Data frame", container=g)
##D   cb <- gcombobox(lsDF(), container=g)
##D   blankDF = data.frame(variables=character(0), stringsAsFactors=FALSE)
##D   tbl <- gtable(blankDF, icon.FUN=icon.FUN, container=g, expand=TRUE)
##D   ## add handlers
##D   addHandlerChanged(cb, handler <- function(h,...) {
##D     dfName <- svalue(h$obj)
##D     dfNames <- names(get(dfName,envir=.GlobalEnv))
##D     tbl[,] <- data.frame(variables=dfNames, stringsAsFactors=FALSE)
##D   })
##D   addHandlerClicked(tbl, handler = function(h,...) {
##D     cat("Do something with",svalue(cb),"::", svalue(h$obj),"\n")
##D   })
##D 
##D 
## End(Not run)



