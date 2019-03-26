library(gWidgets)


### Name: gmenu
### Title: Constructors to make menubars or toolbars
### Aliases: gaction gmenu gtoolbar
### Keywords: interface

### ** Examples

## Not run: 
##D  mbl <- list()
##D  mbl$File$Open$handler = function(h,...) print("open")
##D  mbl$File$Quit$handler = function(h,...) print("quit")
##D  mbl$File$Quit$icon = "quit"
##D  mbl$Edit$Find$handler = function(h,...) print("Find")
##D  mbl$Edit$Replace$handler = function(h,...) print("Replace")
##D 
##D  w <- gwindow("gmenu test")
##D  mb <- gmenu(mbl, container=w)
##D 
##D  tbl <- list()
##D  tbl$New <- list(icon="new",handler = function(...) print("new"))
##D  tbl$Print <- list(icon="print",handler = function(...) print("print"))
##D 
##D  tb <- gtoolbar(tbl, container=w)
##D 
##D  ## example of using gaction
##D  ## works in gWidgetstcltk, but much  better in gWidgetsRGtk2
##D 
##D  ## stub for handler
##D f <- function(h,...) print("stub")
##D 
##D ## some actions. The icon is optional, as is tooltip
##D aOpen <-  gaction(label="Open",   icon="open",  handler=f)
##D aClose <- gaction(label="Close",  icon="close", handler=f)
##D aQuit  <- gaction(label="Quit",   icon="quit",  handler=function(h,...) dispose(w))
##D aCut <-   gaction(label="Cut",    icon="cut",   handler=f)
##D aCopy <-  gaction(label="Copy",   icon="copy",  handler=f)
##D aPaste <- gaction(label="Paste",  icon="paste", handler=f)
##D 
##D ## set up groups of actions so that they can be disabled/enabled
##D ## all at once
##D allActionsGroup <- list(aOpen, aClose, aQuit, aCut, aCopy, aPaste)
##D editActionsGroup <- list(aCut, aCopy, aPaste)
##D 
##D ## define menubar list
##D ml <- list(File = list(
##D              open = aOpen,
##D              close = aClose,
##D              sep = list(separator = TRUE), # must be named component
##D              quit = aQuit),
##D            Edit = list(
##D              copy = aCopy,
##D              paste = aPaste))
##D 
##D ## toolbar list has only one level
##D tl <- list(
##D    Open=aOpen, 
##D    sep = list(separator = TRUE), # must be named component
##D    Quit = aQuit)
##D 
##D ## set up main window
##D w <- gwindow()
##D gmenu(ml, container = w)
##D gtoolbar(tl, container = w)
##D 
##D ## Now add a widget
##D gbutton(action = aQuit, container = w)
##D 
##D ## disable a group of action
##D sapply(editActionsGroup, function(i) enabled(i) <- FALSE)
##D 
## End(Not run)



