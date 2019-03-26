library(fgui)


### Name: guiFrame
### Title: Various Graphical Widgets
### Aliases: guiFrame guiTextEntry guiSlider guiFilename guiOption guiList
###   guiEdit helpButton getSelectedListElements setListElements
### Keywords: interface

### ** Examples


## Not run: 
##D ## Create a form with tcltk routines
##D main <- tktoplevel()
##D ## Create some widgets for that form
##D ## - Create a frame, and put two widgets in it
##D ## - Note that guiTextEntry objects will be gridded automatically
##D ##   (which is why as an example they are put in a frame)
##D fr <- guiFrame( sframe=main )
##D te1 <- guiTextEntry( sframe=fr, text="Text entry 1", default="default" )
##D te2 <- guiTextEntry( sframe=fr, text="Text entry 2", default="" )
##D ## - Put the rest of the widgets on the main frame
##D sl <- guiSlider( sframe=main, text="Slider", default=5, min=1, max=10 )
##D fl <- guiFilename( sframe=main, text="Filename", default="foo.txt" )
##D op <- guiOption( sframe=main, text="Option", choices=c("one","two","three") )
##D ed <- guiEdit( sframe=main, text="Edit", default="Edit box" )
##D ## Now grid the widgets on the main form
##D tkgrid( fr )
##D tkgrid.configure( fr, sticky="nws" ) ## Handle alignment, as in tcl/tk package
##D tkgrid( sl$guiObject )
##D tkgrid( fl$guiObject )
##D tkgrid( op$guiObject )
##D tkgrid( ed$guiObject )
##D print( tclvalue(fl$object) ) ## will print out "foo.txt", unless modified
## End(Not run)




