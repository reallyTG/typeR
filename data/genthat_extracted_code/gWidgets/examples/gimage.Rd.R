library(gWidgets)


### Name: gimage
### Title: Constructor to show images
### Aliases: gimage
### Keywords: interface

### ** Examples

## Not run: 
##D    w <- gwindow("Stock icon example")
##D    gimage("ok",dirname="stock", container = w)
##D 
##D    ## example contributed by Richard Cotton
##D 
##D w <- gwindow("Help button window")
##D add_help_button <- function(help_text, container = w,
##D                             width = getOption("width"), indent = 2, ...) {
##D   gimage("help",	      
##D          dirname   = "stock",
##D          container = container,
##D          handler   = function(h, ...) {
##D            help_win <- gwindow("Help")
##D            help_label <- glabel(text= strwrap(help_text, width = width, indent = indent),
##D                                 container = help_win)
##D          })
##D }
##D 
##D add_help_button(paste("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
##D                       "Nunc magna magna, vestibulum sit amet posuere sit amet, ",
##D 		      "gravida placerat odio.",
##D                       "Integer et purus lorem, quis suscipit risus.", collapse=" "))
##D 
## End(Not run)



