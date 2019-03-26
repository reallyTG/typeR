library(gWidgets)


### Name: gWidgets-dialogs
### Title: Basic dialog constructors
### Aliases: gWidgets-dialogs gmessage galert gconfirm ginput gbasicdialog
### Keywords: interface

### ** Examples

## Not run: 
##D    gmessage("Hi there")
##D    gconfirm("Are we having fun?", handler = function(h,...)
##D    print("Yes"))
##D 
##D    ginput("Enter your name", icon="question", handler = function(h,...) cat("Hi",h$input,"\n"))
##D 
##D    ## gbasicdialog
##D    w <- gbasicdialog(title="Select a state", handler = function(h,...) 
##D       print(svalue(tbl)))
##D    tbl <- gtable(data.frame(states = rownames(state.x77)), expand=TRUE, container = w)
##D    visible(w, set=TRUE) ## show dialog
##D 
## End(Not run)



