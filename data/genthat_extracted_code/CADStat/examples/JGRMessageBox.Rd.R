library(CADStat)


### Name: JGRMessageBox
### Title: Dialog box for predicting env. conditions from biological
###   observations
### Aliases: JGRMessageBox
### Keywords: regression

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (w.title = "BiologicalInferences: Error", msg = "Hello!") 
{
    a <- .jnew("org.neptuneinc.cadstat.plots.BiologicalInferencesGeneralBox")
    .jcall(a, "Ljavax/swing/JFrame;", "getMyGUI", w.title, msg)
  }



