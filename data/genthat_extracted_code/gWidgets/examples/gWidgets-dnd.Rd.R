library(gWidgets)


### Name: gWidgets-dnd
### Title: Functions to add drag and drop ability to widgets
### Aliases: gWidgets-dnd adddroptarget adddropmotion adddropsource
###   addDropTarget addDropMotion addDropSource
### Keywords: interface

### ** Examples

## Not run: 
##D ## simple dnd
##D lab  = glabel("drag me",container=gwindow())
##D ed = gedit("drop here",container = gwindow())
##D adddropsource(lab)
##D adddroptarget(ed)
##D adddropmotion(ed,handler=function(h,...) print("bombs away"))
##D 
##D ## more complicated
##D ## this shows that rows of editable data frame can be dropped.
##D ## by assigning to the changed signal, the graphs can be dynamic.
##D ## THat is, drop a column, then edit it. The graph will update. The key
##D ## is referring to the "value" stored in gd. This refers to the column
##D ## in the editable data frame.
##D ## By using svalue() and id(), the dropped value can also be a
##D ## character string referring to a variable in the workspace.
##D adf = gdf(mtcars, container = gwindow())
##D gd = ggraphics(container = gwindow())
##D plotData = function() {
##D   dropvalue = tag(gd,"value")
##D   theValues = svalue(dropvalue)
##D   theName = id(dropvalue)
##D   hist(theValues, xlab=theName, main="")
##D }
##D 
##D ids = adddroptarget(gd,targetType="object", handler = function(h,...) {
##D     tag(gd, "value") <- h$dropdata
##D     plotData()
##D 
##D     if(is.gdataframecolumn(h$dropdata)) {
##D       view.col = h$dropdata
##D       id = addhandlerchanged(view.col, handler=function(h,...) plotData())
##D     }
##D })
## End(Not run)



