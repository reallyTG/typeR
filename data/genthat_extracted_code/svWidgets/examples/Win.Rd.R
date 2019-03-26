library(svWidgets)


### Name: Win
### Title: Manipulate Windows
### Aliases: winAdd winDel winGet winNames print.guiWin
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ## Creating and destroying a Tk window and inspecting the list
##D winNames()
##D winAdd("tt", title = "My win", pos ="-40+20")
##D winNames()
##D tkwm.deiconify(winGet("tt")) # Standard tcltk functions on the window
##D winDel("tt")
##D winNames()
## End(Not run)



