library(RandomFields)


### Name: RMmodel-class
### Title: Class 'RMmodel'
### Aliases: RMmodel-class show,RMmodel-method print.RMmodel
###   plot,RMmodel,missing-method persp,RMmodel-method image,RMmodel-method
###   points,RMmodel-method lines,RMmodel-method points.RMmodel
###   lines.RMmodel str.RMmodel [,RMmodel-method
###   [,RMmodel,ANY,ANY,ANY-method [<-,RMmodel-method
###   [<-,RMmodel,ANY,ANY,ANY-method +,RMmodel,RMmodel-method
###   +,numeric,RMmodel-method +,logical,RMmodel-method
###   +,RMmodel,numeric-method +,RMmodel,logical-method
###   *,RMmodel,RMmodel-method *,numeric,RMmodel-method
###   *,logical,RMmodel-method *,RMmodel,logical-method
###   *,RMmodel,numeric-method -,RMmodel,RMmodel-method
###   -,numeric,RMmodel-method -,logical,RMmodel-method
###   -,RMmodel,logical-method -,RMmodel,numeric-method
###   /,RMmodel,RMmodel-method /,numeric,RMmodel-method
###   /,logical,RMmodel-method /,RMmodel,numeric-method
###   /,RMmodel,logical-method ^,RMmodel,RMmodel-method
###   ^,numeric,RMmodel-method ^,logical,RMmodel-method
###   ^,RMmodel,numeric-method ^,RMmodel,logical-method c,RMmodel-method
###   RFplotModel
### Keywords: classes print hplot

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
# see RMmodel for introductory examples


# Compare:
model <- RMexp(scale=2) + RMnugget(var=3)
str(model)  ## S4 object as default in version 3 of RandomFields

model <- summary(model)
str(model)  ## list style as in version 2 of RandomFields
            ## see also 'spConform' in 'RFoptions' to make this style
            ## the default

## Don't show: 
FinalizeExample()
## End(Don't show)


