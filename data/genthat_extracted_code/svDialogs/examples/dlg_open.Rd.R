library(svDialogs)


### Name: dlg_open
### Title: Modal dialog to select a file.
### Aliases: dlg_open dlgOpen dlg_filters dlgFilters dlgOpen.gui
###   dlgOpen.textCLI dlgOpen.nativeGUI
### Keywords: datasets misc

### ** Examples

## Not run: 
##D # Choose one R file
##D dlg_open(title = "Select one R file", filters = dlg_filters[c("R", "All"), ])$res
##D # Choose several files
##D dlg_open(multiple = TRUE)$res
## End(Not run)



