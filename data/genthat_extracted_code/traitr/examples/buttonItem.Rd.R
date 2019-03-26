library(traitr)


### Name: buttonItem
### Title: Button item to initiate an action
### Aliases: buttonItem

### ** Examples

## basic button. Note the extra "." compared to gWidgets handler
b <- buttonItem("click me", action=function(.,h,...) {
       print("hi")

     })
## An example within a dialog
dlg <- aDialog(items=list(
                a = stringItem(""),
                b = buttonItem("Click me", label="", action=function(., h, ...) {
                  galert(sprintf("Item a is %s\n", .$parent$get_a()))
                })
                ),
              title="A dialog with a button item",
              buttons=c()               # no standard buttons
              )
   ## Not run: dlg$make_gui()



