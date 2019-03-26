library(traitr)


### Name: variableSelectorItem
### Title: Item to select a variable (or variables) from a selected data
###   frame
### Aliases: variableSelectorItem

### ** Examples

df <- data.frame(a=1:3, b= letters[1:3], c=rnorm(3)) # make a data frame
dfI <- dataframeItem(value="df", name="dfI")
dlg <- aDialog(items=list(
       dfI,                      ## a bit awkward -- can't define dfI in list of items
variable=variableSelectorItem(dataframeItem=dfI))
)
## Not run:  dlg$make_gui() 



