library(svDialogs)


### Name: dlg_list
### Title: Modal dialog to select one or more items in a list.
### Aliases: dlg_list dlgList dlgList.gui dlgList.textCLI dlgList.nativeGUI
### Keywords: misc

### ** Examples

## Not run: 
##D # Select one or several months
##D res <- dlg_list(month.name, multiple = TRUE)$res
##D if (!length(res)) {
##D   cat("You cancelled the choice\n")
##D } else {
##D   cat("You selected:\n")
##D   print(res)
##D }
## End(Not run)



