library(VarSelLCM)


### Name: MICL
### Title: MICL criterion
### Aliases: MICL

### ** Examples

## Not run: 
##D # Data loading:
##D data("heart")
##D 
##D # Cluster analysis with variable selection
##D object <- VarSelCluster(heart[,-13], 2, vbleSelec = TRUE, crit.varsel = "MICL")
##D 
##D # Get the MICL value
##D MICL(object)
## End(Not run)



