library(svDialogs)


### Name: dlg_input
### Title: Modal dialog to input a string or a value.
### Aliases: dlg_input dlgInput dlgInput.gui dlgInput.textCLI
###   dlgInput.nativeGUI
### Keywords: misc

### ** Examples

## Not run: 
##D # Ask something...
##D user <- dlg_input("Who are you?", Sys.info()["user"])$res
##D if (!length(user)) {# The user clicked the 'cancel' button
##D   cat("OK, you prefer to stay anonymous!\n")
##D } else {
##D   cat("Hello", user, "\n")
##D }
## End(Not run)



