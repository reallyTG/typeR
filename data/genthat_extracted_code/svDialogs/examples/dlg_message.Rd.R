library(svDialogs)


### Name: dlg_message
### Title: Display a modal message box.
### Aliases: dlg_message dlgMessage msg_box msgBox ok_cancel_box
###   okCancelBox dlgMessage.gui dlgMessage.textCLI dlgMessage.nativeGUI
### Keywords: misc

### ** Examples

## Not run: 
##D # A simple information box
##D dlg_message("Hello world!")$res
##D 
##D # Ask to continue
##D dlg_message(c("This is a long task!", "Continue?"), "okcancel")$res
##D 
##D # Ask a question
##D dlg_message("Do you like apples?", "yesno")$res
##D 
##D # Idem, but one can interrupt too
##D res <- dlg_message("Do you like oranges?", "yesnocancel")$res
##D if (res == "cancel")
##D   cat("Ah, ah! You refuse to answer!\n")
##D 
##D # Simpler version with msgBox and okCancelBox
##D msg_box("Information message") # Use this to interrupt script and inform user
##D if (ok_cancel_box("Continue?")) cat("we continue\n") else cat("stop it!\n")
## End(Not run)



