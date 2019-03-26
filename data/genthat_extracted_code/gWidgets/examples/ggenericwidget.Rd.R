library(gWidgets)


### Name: ggenericwidget
### Title: A constructor to create widgets for evaluating functions
### Aliases: ggenericwidget
### Keywords: interface

### ** Examples

## Not run: 
##D 	## a sample list definition
##D ## Save some typing by defining a list to be used more than once later
##D TRUE.list <- list(
##D   type = "gradio",
##D   items = c("TRUE","FALSE")
##D   )
##D 
##D ## define a list for producing a histogram widget	  
##D hist.list <- list(
##D   title = "hist()",
##D   help = "hist",
##D   action = list(
##D     beginning = "hist(",
##D     ending = ")"
##D     ),
##D   type = "graphic",                      # either text or graphic
##D   variableType = "univariate",           # single variable
##D   arguments = list(
##D     adjustments = list(
##D       breaks= list(
##D         type="gdroplist",
##D         items=c("\"Sturges\"","\"Scott\"","\"Friedman-Diaconis\"")
##D         ),
##D       probability = TRUE.list,
##D       include.lowest = TRUE.list,
##D       right = TRUE.list,
##D       shading = list(
##D         density = list(
##D             type="gedit",
##D             text=NULL
##D         ),
##D       angle = list(
##D         type="gedit",
##D         coerce.with="as.numeric",
##D         text="45"
##D         )
##D         )
##D       )
##D     )
##D   )
##D 
##D ggenericwidget(hist.list, container=TRUE)
##D ## or to autogenerate one
##D ggenericwidget("boxplot.default", container=TRUE)
##D 	
## End(Not run)



