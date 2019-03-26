library(traitr)


### Name: graphicDeviceItem
### Title: A graphic device item. (Only with RGtk2 and cairoDevice!)
### Aliases: graphicDeviceItem

### ** Examples

graphIt <- function(n, ...) hist(rnorm(n))
dlg <- aDialog(items=list(n=integerItem(10), out=graphicDeviceItem()),
model_value_changed=function(.) do.call("graphIt", .$to_R()) ## ... allows out to pass in unnoticed
)
## Not run: 
##D dlg$make_gui()
##D graphIt(dlg$get_n()) ## initial graphic
## End(Not run)



