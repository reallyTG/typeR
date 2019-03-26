library(gWidgets)


### Name: gformlayout
### Title: A constructor for laying out groups of widgets from a template
###   defined by a list
### Aliases: gformlayout
### Keywords: interface

### ** Examples

## Not run: 
##D 
##D ## layout a collection of widgets to generate a t.test
##D tTest <- list(type = "ggroup",
##D               horizontal = FALSE,
##D               children = list(
##D                 list(type="fieldset",
##D                      columns = 2,
##D                      label = "Variable(s)",
##D                      label.pos = "top",
##D                      label.font = c(weight="bold"),
##D                      children = list(
##D                        list(name = "x",
##D                             label = "x",
##D                             type = "gedit",
##D                             text = ""),
##D                        list(name = "y",
##D                             label = "y",
##D                             type = "gedit",
##D                             text = "",
##D                             depends.on = "x",
##D                             depends.FUN = function(value) nchar(value) > 0,
##D                             depends.signal = "addHandlerBlur"
##D                             )
##D                        )
##D                      ),
##D                 list(type = "fieldset",
##D                      label = "Hypotheses",
##D                      columns = 2, 
##D                      children = list(
##D                        list(name = "mu",
##D                             type = "gedit",                            
##D                             label = "Ho: mu=",
##D                             text = "0",
##D                             coerce.with = as.numeric),
##D                        list(name = "alternative",
##D                             type="gcombobox",
##D                             label = "HA: ",
##D                             items = c("two.sided","less","greater")
##D                             )
##D                        )
##D                      ),
##D                 list(type = "fieldset",
##D                      label = "two sample test",
##D                      columns = 2,
##D                      depends.on = "y",
##D                      depends.FUN = function(value) nchar(value) > 0,
##D                      depends.signal = "addHandlerBlur",                     
##D                      children = list(
##D                        list(name = "paired",
##D                             label = "paired samples",
##D                             type = "gcombobox",
##D                             items = c(FALSE, TRUE)
##D                             ),
##D                        list(name = "var.equal",
##D                             label = "assume equal var",
##D                             type = "gcombobox",
##D                             items = c(FALSE, TRUE)
##D                             )
##D                        )
##D                      ),
##D                 list(type = "fieldset",
##D                      columns = 1,
##D                      children = list(
##D                        list(name = "conf.level",
##D                             label = "confidence level",
##D                             type = "gedit",
##D                             text = "0.95",
##D                             coerce.with = as.numeric)
##D                        )
##D                      )
##D                 )
##D               )
##D 
##D w <- gwindow("t.test")
##D g <- ggroup(horizontal = FALSE, container = w)
##D fl <- gformlayout(tTest, container = g, expand=TRUE)
##D bg <- ggroup(container = g)
##D addSpring(bg)
##D b <- gbutton("run t.test", container = bg)
##D addHandlerChanged(b, function(h,...) {
##D   out <- svalue(fl)
##D   out$x <- svalue(out$x) # turn text string into numbers via get()
##D   if(out$y == "") {
##D     out$y <- out$paired <- NULL 
##D   } else {
##D    out$y <- svalue(out$y)
##D   }
##D   print(do.call("t.test",out))
##D })
## End(Not run)		



