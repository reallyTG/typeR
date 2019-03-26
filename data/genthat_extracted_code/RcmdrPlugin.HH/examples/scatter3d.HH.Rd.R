library(RcmdrPlugin.HH)


### Name: scatter3dHH
### Title: Three-Dimensional Scatterplots and Point Identification
### Aliases: scatter3dHH
### Keywords: hplot

### ** Examples

    ## Not run: 
##D State.x77 <- as.data.frame(state.x77)
##D with(State.x77, scatter3d(Income, Murder, Illiteracy))
##D with(State.x77, Identify3d(Income, Murder, Illiteracy, labels=row.names(State.x77)))
##D with(State.x77,  scatter3d(Income, Murder, Illiteracy, fit=c("linear", "quadratic")))
##D     
## End(Not run)



