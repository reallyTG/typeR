library(svIDE)


### Name: guiDDEInstall
### Title: install a DDE server (Windows only) for external IDE/code editor
### Aliases: guiDDEInstall guiCallTip guiComplete
### Keywords: utilities

### ** Examples

## Not run: 
##D ## DDE exchange protocol is available ONLY under Windows!
##D 
##D ## Also, this cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ## Here is how you can test these features under Windows
##D options(use.DDE = TRUE)
##D library(svIDE) # This should automatically start the
##D ## DDE server named 'TclEval SciViewsR', according to the option set
##D 
##D ## Get some data in the user workspace
##D data(trees)
##D a <- 1
##D b <- "some text in the first instance of R"
##D 
##D #######################################################
##D ## To test these functions in an external program, we need now
##D ## to start a second instance of R. In this second instance, enter:
##D library(tcltk)
##D .Tcl("package require dde")
##D .Tcl("dde services TclEval {}")
##D ## You should get 'TclEval SciViewsR' in the list
##D ## if the server in the first instance is running
##D 
##D ## Now, request a calltip for the function 'ls'
##D ## This is done in two steps:
##D ## 1) Execute the command 'guiCallTip' with this code chunk as argument
##D .Tcl("dde execute TclEval SciViewsR {guiCallTip {res <- ls(}}")
##D ## 2) Retrieve the calltip from the variable SciViewsR_CallTip
##D .Tcl("dde request TclEval SciViewsR SciViewsR_CallTip")
##D 
##D ## Another way to trigger DDE commands (for programs that do not support
##D ## DDE is to use 'execdde.exe' of the tcltk2 package (see ?tk2dde)
##D 
##D ## It is also possible to copy the calltip to a file, or to the clipboard
##D ## by specifying it after the command (also the two additional arguments
##D ## have their default values changed)
##D .Tcl("dde execute TclEval SciViewsR {guiCallTip {library(} clipboard TRUE 40 TRUE}")
##D ## Look at what is in the clipboard
##D cat(readClipboard(), "\n")
##D 
##D ## The process is similar to get completion lists
##D .Tcl("dde execute TclEval SciViewsR {guiComplete {iris$}}")
##D .Tcl("dde request TclEval SciViewsR SciViewsR_Complete")
##D 
##D ## Get the list of variables in the user workspace of the first R instance
##D ## into the clipboard (use also the other arguments to get the type of objects)
##D .Tcl("dde execute TclEval SciViewsR {guiComplete {} clipboard TRUE { - }}")
##D ## Look at what is in the clipboard
##D cat(readClipboard(), "\n")
## End(Not run)



