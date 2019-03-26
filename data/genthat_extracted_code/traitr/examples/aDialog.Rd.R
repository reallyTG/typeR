library(traitr)


### Name: aDialog
### Title: Create a Dialog instance
### Aliases: aDialog

### ** Examples

##
## a Basic example
dlg <- aDialog(items=list(
                 a = numericItem(0),
                 b = stringItem("a")
                 ),
               title="The title",
               help_string="Help on this dialog"
               )
## Not run: dlg$make_gui()
##
##
## example with model_value_changed
plotIt <- function(n, mean, sd, ...) hist(rnorm(n, mean, sd))
dlg <- aDialog(items=list(
  n = integerItem(10),
  mean = numericItem(0),
  sd = numericItem(1),
  out=graphicDeviceItem()
),
buttons="Cancel",
model_value_changed=function(.) if(.$is_valid()) do.call("plotIt", .$to_R())
)
##
## validation for n, sd
n <- dlg$get_item_by_name("n")
n$validate <- function(., rawvalue) {
  if(rawvalue <= 1) stop("n must be positive integer") else rawvalue
}
sd <- dlg$get_item_by_name("sd")
sd$validate <- function(., rawvalue) {
  if(rawvalue <- 0) stop("sd must be positive") else rawvalue
}
## Not run: dlg$make_gui()
##
##
## subtle point about scope. Proto methods can be defined via $<- or [[<- but there is a difference.
## $<- does not have lexical scope whereas [[<- does. The $<- might be more natural to type,
## but [[<- might be more natural to use. In this example,
## The "b" button does not work, as it can't find the
## function a -- the frame of evaluation is the environment dlg (not its enclosing frame).
## Thanks to Gabor for his help with this.
scope_example <- function() {
a <- function(...) print("hi")
dlg <- aDialog(items=list(),
                buttons=c("a","b","c"),
                a_handler=function(.) a(),   ## like [[<-, not $<-
                title="a, c work; b doesn't"
                )
 dlg$b_handler <- function(.) a()  ## $<- has unbound variables found in dlg
 dlg[['c_handler']] <- a           ## [[<- uses lexical scope for unbound variables
}
## Not run: scope_example()
## See ?anItemGroup for an example of a modal dialog



