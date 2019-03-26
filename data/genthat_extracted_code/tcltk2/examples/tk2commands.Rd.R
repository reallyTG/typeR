library(tcltk2)


### Name: tk2commands
### Title: Tk commands associated with the tk2XXX widgets
### Aliases: tk2commands tk2column tk2insert.multi tk2list.delete
###   tk2list.get tk2list.insert tk2list.set tk2list.size tk2notetraverse
###   tk2notetab tk2notetab.select tk2notetab.text tk2state.set is.tk
###   is.ttk tk2theme.elements tk2theme.list tk2theme tk2style tk2dataList
###   tk2configList
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D tt <- tktoplevel()
##D # A label with a image and some text
##D file <- system.file("gui", "SciViews.gif", package = "tcltk2")
##D 
##D # Make this a tk2image function...
##D Image <- tclVar()
##D tkimage.create("photo", Image, file = file)
##D 
##D tlabel <- tk2label(tt, image = Image,
##D 	text = "A label with an image")
##D tkpack(tlabel)
##D config(tlabel, compound = "left")
##D 
##D tlabel2 <- tk2label(tt, text = "A disabled label")
##D tkpack(tlabel2)
##D disabled(tlabel2) <- TRUE
##D 
##D fruits <- c("Apple", "Orange", "Banana")
##D tcombo <- tk2combobox(tt, values = fruits)
##D tkpack(tcombo)
##D tkinsert(tcombo, 0, "Apple")
##D 
##D ## Buttons
##D tbut <- tk2button(tt, text = "Enabled")
##D tbut2 <- tk2button(tt, text = "Disabled")
##D tkpack(tbut, tbut2)
##D tkconfigure(tbut2, state = "disabled")
##D 
##D tcheck <- tk2checkbutton(tt, text = "Some checkbox")
##D tcheck2 <- tk2checkbutton(tt, text = "Disabled checkbox")
##D tkconfigure(tcheck2, state = "disabled")
##D tcheck3 <- tk2checkbutton(tt, text = "Disabled and selected")
##D tkpack(tcheck, tcheck2, tcheck3)
##D cbValue <- tclVar("1")
##D tkconfigure(tcheck3, variable=cbValue)
##D tkconfigure(tcheck3, state = "disabled")
##D 
##D tradio <- tk2radiobutton(tt, text = "Some radiobutton")
##D tradio2 <- tk2radiobutton(tt, text = "Disabled and checked")
##D tkpack(tradio, tradio2)
##D tkconfigure(tradio2, state = "checked")
##D tkconfigure(tradio2, state = "disabled")
##D 
##D ## Menu allowing to change ttk theme
##D topMenu <- tkmenu(tt)           # Create a menu
##D tkconfigure(tt, menu = topMenu) # Add it to the 'tt' window
##D themes <- tk2theme.list()
##D themeMenu <- tkmenu(topMenu, tearoff = FALSE)
##D if ("alt" %in% themes) tkadd(themeMenu, "command", label = "alt",
##D     command = function() tk2theme("alt"))
##D if ("aqua" %in% themes) tkadd(themeMenu, "command", label = "aqua",
##D     command = function() tk2theme("aqua"))
##D if ("clam" %in% themes) tkadd(themeMenu, "command", label = "clam",
##D     command = function() tk2theme("clam"))
##D tkadd(themeMenu, "command", label = "clearlooks",
##D     command = function() tk2theme("clearlooks"))
##D if ("classic" %in% themes) tkadd(themeMenu, "command", label = "classic",
##D     command = function() tk2theme("classic"))
##D if ("default" %in% themes) tkadd(themeMenu, "command", label = "default",
##D     command = function() tk2theme("default"))
##D tkadd(themeMenu, "command", label = "keramik",
##D     command = function() tk2theme("keramik"))
##D tkadd(themeMenu, "command", label = "plastik",
##D     command = function() tk2theme("plastik"))
##D tkadd(themeMenu, "command", label = "radiance (fonts change too)!",
##D     command = function() tk2theme("radiance"))
##D if ("vista" %in% themes) tkadd(themeMenu, "command", label = "vista",
##D     command = function() tk2theme("vista"))
##D if ("winnative" %in% themes) tkadd(themeMenu, "command", label = "winnative",
##D     command = function() tk2theme("winnative"))
##D if ("xpnative" %in% themes) tkadd(themeMenu, "command", label = "xpnative",
##D     command = function() tk2theme("xpnative"))
##D tkadd(themeMenu, "separator")
##D tkadd(themeMenu, "command", label = "Quit", command = function() tkdestroy(tt))
##D tkadd(topMenu, "cascade", label = "Theme", menu = themeMenu)
##D tkfocus(tt)
## End(Not run)



