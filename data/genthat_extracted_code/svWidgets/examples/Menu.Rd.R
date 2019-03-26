library(svWidgets)


### Name: Menu
### Title: Conveniently manipulate menus, whatever the window
### Aliases: menuAdd menuAddItem menuDel menuDelItem menuNames menuInvoke
###   menuItems menuType menuChangeItem menuStateItem menuRead
###   menuReadPackage print.guiMenu
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D ## Run these commands one at a time and look at menus...
##D 
##D 
##D ### Under RGui and Windows only! ###
##D ## Create menus in Rgui, using a specification file
##D menuReadPackage("svWidgets")
##D menuNames()
##D (menuItems("$ConsoleMain/Testit"))
##D 
##D ## Create menus manually in Rgui
##D menuAdd("$ConsoleMain/Testit2")
##D menuAddItem("$ConsoleMain/Testit2", "Trial", "ls()")
##D menuNames()
##D (menuItems("$ConsoleMain/Testit2"))
##D menuStateItem("$ConsoleMain/Testit2", "Trial", FALSE)
##D menuStateItem("$ConsoleMain/Testit2", "Trial", TRUE)
##D ## Buggy? -> menuChangeItem("$ConsoleMain/Testit2", "Trial", "search()")
##D (menuItems("$ConsoleMain/Testit2"))
##D 
##D 
##D ### Under any system supporting Tcl/Tk ###
##D ## Create and manipulate Tk menus
##D winAdd("tt", title = "A Tk window with menus", pos ="-40+20")
##D menuAdd("$Tk.tt/Misc")
##D menuNames()
##D (menuItems("$Tk.tt/Misc"))  # Still nothing in it
##D menuAddItem("$Tk.tt/Misc", "List &variables", "print(ls(envir = .GlobalEnv))")
##D menuAddItem("$Tk.tt/Misc", "Say &yo!", "cat('yo!\n')")
##D 
##D menuDelItem("$Tk.tt/Misc", "Say &yo!")
##D menuAddItem("$Tk.tt/Misc", "-")
##D menuAddItem("$Tk.tt/Misc", "&Say yo! twice", "cat('yo! yo!\n')")
##D (menuItems("$Tk.tt/Misc"))
##D 
##D imgReadPackage("svWidgets")  # Make sure images are loaded
##D menuAdd("$Tk.tt/Misc/Sub&Menu")
##D menuAddItem("$Tk.tt/Misc/Sub&Menu", "T&rial", "cat('Trial trigerred!\n')")
##D menuAddItem("$Tk.tt/Misc", "Tria&l2", "cat('Trial with image and accel!\n')",
##D 	image = "$Tk.butOpen", accel = "Ctrl+T")
##D menuNames()
##D (menuItems("$Tk.tt/Misc"))
##D menuStateItem("$Tk.tt/Misc", "Tria&l2", FALSE)
##D menuStateItem("$Tk.tt/Misc", "Tria&l2", TRUE)
##D menuStateItem("$Tk.tt/Misc", "Sub&Menu", FALSE)
##D menuStateItem("$Tk.tt/Misc", "Sub&Menu", TRUE)
##D menuChangeItem("$Tk.tt/Misc", "Tria&l2", options = "underline = 1")
##D ## This is the way to change binding
##D tkbind(WinGet("tt"), "<Control-r>", function() menuInvoke("$Tk.tt/Misc", "Tria&l2"))
##D menuChangeItem("$Tk.tt/Misc", "Tria&l2", action = 'cat("new action for Tria&l2!\n")')
##D menuInvoke("$Tk.tt/Misc", "Tria&l2")
##D (menuItems("$Tk.tt/Misc"))
##D menuDelItem("$Tk.tt/Misc", "Tria&l2")
##D menuDel("$Tk.tt/Misc")
##D menuNames()
##D ## The following command generates an error!
##D (menuItems("$Tk.tt/Misc"))
##D winDel("tt")
## End(Not run)



