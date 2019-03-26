library(gWidgets)


### Name: gfile
### Title: Dialogs for file and date selection
### Aliases: gfile gfilebrowse gcalendar
### Keywords: interface

### ** Examples

## Not run: 
##D ## source a file using a handler
##D sourceFile <- function() gfile("Select a file",type="open", handler =
##D function(h,...) source(h$file))
##D 
##D ## source an R file using fact that dialog is modal
##D source(gfile(filter=c("R files"="R")))
##D 
##D ## apply a generic action to the file
##D countLines <- function(filename) print(length(readLines(filename)))
##D chooseFile <- function() gfile("Select a file",type="open",
##D action="countLines", handler = function(h,...) do.call(h$action,list(h$file)))
## End(Not run)



