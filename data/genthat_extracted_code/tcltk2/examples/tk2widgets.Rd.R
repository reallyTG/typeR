library(tcltk2)


### Name: tk2widgets
### Title: A series of versatile using either themable ttk widgets
### Aliases: tk2widgets tk2button tk2canvas tk2checkbutton tk2combobox
###   tk2entry tk2frame tk2label tk2labelframe tk2listbox tk2mclistbox
###   tk2menu tk2menubutton tk2message tk2notebook tk2panedwindow
###   tk2progress tk2radiobutton tk2scale tk2scrollbar tk2separator
###   tk2spinbox tk2table tk2tablelist tk2text tk2ctext tk2tree
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ### A tk2notebook example
##D tt2 <- tktoplevel()
##D nb <- tk2notebook(tt2, tabs = c("Test", "Button"))
##D tkpack(nb, fill = "both", expand = 1)
##D tb1 <- tk2notetab(nb, "Test")
##D lab <- tk2label(tb1, text = "Nothing here.")
##D tkpack(lab)
##D tb2 <- tk2notetab(nb, "Button")
##D but <- tk2button(tb2, text = "Click me", command = function() tkdestroy(tt2))
##D tkgrid(but)
##D tk2notetab.select(nb, "Button")
##D tk2notetab.text(nb) # Text of the currently selected tab
##D 
##D ### A simple tk2panedwindow example
##D tt2 <- tktoplevel()
##D pw <- tk2panedwindow(tt2, orient = "vertical")
##D lpw.1 <- tk2text(pw)
##D lpw.2 <- tk2text(pw)
##D tkadd(pw, lpw.1)#, minsize = 100)
##D tkadd(pw, lpw.2)#, minsize = 70)
##D but <- tk2button(tt2, text = "OK", width = 10,
##D     command = function() tkdestroy(tt2))
##D tkpack(pw, fill = "both", expand = "yes")
##D tkpack(but)
##D ## Resize the window and move the panel separator with the mouse
##D 
##D ### A tk2combobox example
##D tt2 <- tktoplevel()
##D cb <- tk2combobox(tt2)
##D tkgrid(cb)
##D ## Fill the combobox list
##D fruits <- c("Apple", "Orange", "Banana")
##D tk2list.set(cb, fruits)
##D tk2list.insert(cb, "end", "Scoubidou", "Pear")
##D tk2list.delete(cb, 3)   # 0-based index!
##D tk2list.size(cb)
##D tk2list.get(cb)   # All items
##D ## Link current selection to a variable
##D Fruit <- tclVar("Pear")
##D tkconfigure(cb, textvariable = Fruit)
##D ## Create a button to get the content of the combobox
##D but <- tk2button(tt2, text = "OK", width = 10,
##D     command = function() {tkdestroy(tt2); cat(tclvalue(Fruit), "\n")})
##D tkgrid(but)
##D 
##D ### An example of a tk2spinbox widget
##D tt2 <- tktoplevel()
##D tspin <- tk2spinbox(tt2, from = 2, to = 20, increment = 2)
##D tkgrid(tspin)
##D ## This widget is not added yet into tcltk2!
##D #tdial <- tk2dial(tt2, from = 0, to = 20, resolution = 0.5, width = 70,
##D #	tickinterval = 2)
##D #tkgrid(tdial)
##D tbut <- tk2button(tt2, text = "OK", width = 10,
##D     command = function() tkdestroy(tt2))
##D tkgrid(tbut)
##D 
##D ### A tk2mclistbox example
##D tt2 <- tktoplevel()
##D mlb <- tk2mclistbox(tt2, width = 55, resizablecolumns = TRUE)
##D ## Define the columns
##D tk2column(mlb, "add", "name", label = "First name", width = 20)
##D tk2column(mlb, "add", "lastname", label = "Last name", width = 20)
##D tk2column(mlb, "add", "org", label = "Organisation", width = 15)
##D tkgrid(mlb)
##D ## Fill the multicolumn list (we can use a vector, or a matrix of character strings)
##D item1 <- c("Bryan", "Oackley", "ChannelPoint")
##D items <- matrix(c("John", "Ousterhout", "Scriptics", "Steve", "Miller", "TclTk inc."),
##D     ncol = 3, byrow = TRUE)
##D tk2insert.multi(mlb, "end", item1)
##D tk2insert.multi(mlb, "end", items)
##D #### TODO: bind events
##D ### Ex: .listbox label bind date <ButtonPress-1> "sortByDate ##D 
##D ### See the example.tcl in .\libs\mclistbox1.02 for a more complex example
##D ### Create a button to close the dialog box
##D but <- tk2button(tt2, text = "OK", width = 10,
##D     command = function() tkdestroy(tt2))
##D tkgrid(but)
##D 
##D ### A simple tk2table example (Tktable is required here!)
##D myRarray <- c("Animal", "\"sphinx moth\"", "oyster", "Type", "insect", "mollusk")
##D dim(myRarray) <- c(3, 2)
##D for (i in (0:2))
##D     for (j in (0:1))
##D         .Tcl(paste("set tclarray(", i, ",", j, ") ", myRarray[i+1, j+1], sep = ""))
##D tt2 <- tktoplevel()
##D table1 <- tk2table(tt2, variable = "tclarray", rows = "3", cols = "2",
##D     titlerows = "1", selectmode = "extended", colwidth = "25", background = "white")
##D tkpack(table1)
##D 
##D ## A tablelist example
##D tt <- tktoplevel()
##D tlist <- tk2tablelist(tt, columntitles = c("First column", "Second column"),
##D     stretch = "all", expand = 1)
##D tkpack(tlist, fill = "both")
##D tkinsert(tlist, "end", c("first row", "another value"))
##D tkinsert(tlist, "end", c("another row", "bla bla"))
##D tbut <- tk2button(tt, text = "Done", command = function () tkdestroy(tt))
##D tkpack(tbut)
## End(Not run)



