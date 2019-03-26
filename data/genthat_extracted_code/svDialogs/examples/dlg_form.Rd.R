library(svDialogs)


### Name: dlg_form
### Title: Modal dialog to fill a series of different fields.
### Aliases: dlg_form dlgForm dlgForm.gui dlgForm.textCLI dlgForm.nativeGUI
### Keywords: misc

### ** Examples

## Not run: 
##D # Ask a series of items at once in a dialog box
##D form <- list(
##D   "Name:TXT" = "John Smith",
##D   "Age:NUM" = 25,
##D   "Sex:CB" = c("male", "female"),
##D   "Married:CHK" = FALSE
##D )
##D dlg_form(form, "My data")$res
## End(Not run)



