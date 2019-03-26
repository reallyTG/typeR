library(streambugs)


### Name: construct.statevariables
### Title: Construct the streambugs ODE state variable names
### Aliases: construct.statevariables

### ** Examples

Reaches           <- paste0("Reach",1:2)
Habitats          <- paste0("Hab",1:1)
y.names <- construct.statevariables(Reaches,Habitats,Invertebrates=c("Baetis","Ecdyonurus"))




