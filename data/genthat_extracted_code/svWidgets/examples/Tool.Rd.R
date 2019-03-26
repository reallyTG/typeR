library(svWidgets)


### Name: Tool
### Title: Conveniently manipulate toolbars, whatever the window
### Aliases: toolAdd toolAddItem toolDel toolDelItem toolNames toolInvoke
###   toolItems toolType toolChangeItem toolStateItem toolRead
###   toolReadPackage print.guiTool
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D ## Run these commands one at a time
##D 
##D winAdd("tt", title = "A Tk window with toolbars", pos ="-40+20")
##D imgReadPackage("svWidgets")     # Make sure images are loaded
##D ## Create a toolbar and populate it
##D toolAdd("$Tk.tt/Main")
##D toolNames()
##D (toolItems("$Tk.tt/Main"))   # Still nothing in it
##D toolAddItem("$Tk.tt/Main", "List variables",
##D     action = "print(ls(envir = .GlobalEnv))", image = "$Tk.butCopy")
##D toolAddItem("$Tk.tt/Main", "Say yo!", action = "cat('yo!\n')")
##D toolAddItem("$Tk.tt/Main", "-")
##D toolAddItem("$Tk.tt/Main", "Search",
##D     action = "print(search())", image = "$Tk.butPaste")
##D (toolItems("$Tk.tt/Main"))
##D ## Change state of buttons in the toolbar
##D toolStateItem("$Tk.tt/Main", "Search", FALSE)
##D toolStateItem("$Tk.tt/Main", "Search", TRUE)
##D toolStateItem("$Tk.tt/Main", "Say yo!", FALSE)
##D toolStateItem("$Tk.tt/Main", "Say yo!", TRUE)
##D ## Invoke a button
##D toolInvoke("$Tk.tt/Main", "Say yo!")
##D ## Remove a button and add another one (always at the end!)
##D toolDelItem("$Tk.tt/Main", "Say yo!")
##D toolAddItem("$Tk.tt/Main", "Say yo! twice", "cat('yo! yo!\n')")
##D (toolItems("$Tk.tt/Main"))
##D toolDel("$Tk.tt/Main")
##D toolNames()
##D (toolItems("$Tk.tt/Main"))
##D winDel("tt")
## End(Not run)



