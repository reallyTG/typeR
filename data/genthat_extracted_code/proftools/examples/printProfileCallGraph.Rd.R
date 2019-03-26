library(proftools)


### Name: printProfileCallGraph
### Title: Print Call Graph for Rprof Profile Data
### Aliases: printProfileCallGraph
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
printProfileCallGraph(pd)
## Not run: 
##D ## If you have graphviz and cgprof installed on a UNIX-like system
##D ## then in R do:
##D 
##D pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
##D printProfileCallGraph(pd, "foo.graph")
##D 
##D ## and then in a shell do (to use the interactive dotty):
##D 
##D cgprof -TX foo.graph
##D 
##D ## or (to create a postscript version and view with gv):
##D 
##D cgprof -Tps foo.graph > foo.ps
##D gv foo.ps
##D   
## End(Not run)



