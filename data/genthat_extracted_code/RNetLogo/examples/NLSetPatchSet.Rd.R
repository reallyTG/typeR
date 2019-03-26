library(RNetLogo)


### Name: NLSetPatchSet
### Title: Sets the variable value of one or more patch(es) to value(s) in
###   a data.frame.
### Aliases: NLSetPatchSet
### Keywords: interface NLSetAgentSet RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D # NLLoadModel(...)
##D 
##D # for NetLogo 2D:
##D input <- NLGetPatches(c("pxcor","pycor","pcolor"))
##D str(input)
##D # for NetLogo 3D:
##D input <- NLGetPatches(c("pxcor","pycor","pzcor","pcolor"))
##D str(input)
##D 
##D input$pcolor <- floor(abs(rnorm(nrow(input))*100)) 
##D patch.var <- "pcolor"
##D NLSetPatchSet(patch.var, input)
## End(Not run)



