library(gWidgets)


### Name: gWidgets-handlers
### Title: Methods to add event handlers to objects
### Aliases: gWidgets-handlers removehandler addhandlerchanged
###   addhandlerkeystroke addhandlerclicked addhandlerdoubleclick
###   addhandlerrightclick addhandlerfocus addhandlerblur addhandlerexpose
###   addhandlermousemotion addhandlerunrealize addhandlerdestroy
###   addhandleridle addpopupmenu add3rdmousepopupmenu addhandler
###   addHandler removeHandler blockHandler unblockHandler
###   addHandlerChanged addHandlerKeystroke addHandlerClicked
###   addHandlerDoubleclick addHandlerRightclick addHandlerFocus
###   addHandlerBlur addHandlerMouseMotion addHandlerExpose
###   addHandlerUnrealize addHandlerDestroy addHandlerIdle
###   addHandlerColumnClicked addhandlercolumnclicked
###   addHandlerColumnRightclick addhandlercolumnrightclick
###   addHandlerColumnDoubleclick addhandlercolumndoubleclick addPopupmenu
###   add3rdMousePopupmenu removeHandler
### Keywords: interface

### ** Examples

## Not run: 
##D 	## a default handler, useful for when action is enough to
##D 	## specify desired results
##D 
##D 	handler.default = function(h,...) do.call(h$action,list(svalue(h$obj)))
##D 	group = ggroup(horizontal=FALSE, container=gwindow("Click
##D 		button"))
##D         button = gbutton("Click me", container=group)
##D 	addhandlerclicked(button, handler=handler.default, action="print")
##D 
##D 
##D 	## use two widgets, one to update the other
##D 	group = ggroup(horizontal=FALSE, container=gwindow("two widgets"))
##D 	button = gbutton("click me", container=group)
##D 	label = glabel("Button has not been clicked", container=group)
##D 	addhandlerclicked(button, handler = function(h,...) {
##D 	svalue(h$obj) <-"click me again"
##D 	svalue(h$action) <- "Button has been clicked"
##D 	}, action = label)
##D 
##D 
##D 	## lazy evaluation is not used here
##D 	obj = 4
##D 	gbutton("click",container=TRUE, handler=function(h,...)
##D 	print(h$action), action=obj)
##D 	obj = 2
##D 	## now click button and value of 4 will be printed, not 2
##D 
##D 	## Whereas, if one uses a gWidget we get the same as lazy
##D        ## loading
##D        obj = gedit("4")		 
##D 	gbutton("click",container=TRUE, handler=function(h,...)
##D 		print(svalue(h$action)), action=obj)
##D 	svalue(obj) <- "2"
##D 	## Now click and "2" is printed.
##D 
##D       ## remove handler, block handler, unblockhandler (latter two may not be implemented)
##D       b <- gbutton("click", container=gwindow())
##D       id <- addHandlerClicked(b, handler=function(h,...) print("ouch"))
##D       ## click --> "ouch"
##D       blockHandler(b, id) ## now click -- nothing
##D       unblockHandler(b, id) ## now click -- "ouch"
##D       removeHandler(b, id)  ## all gone now
## End(Not run)



