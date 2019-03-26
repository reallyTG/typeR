library(graphicalVAR)


### Name: mlGraphicalVAR
### Title: Pooled and individual graphical VAR estimation
### Aliases: mlGraphicalVAR

### ** Examples

## Not run: 
##D # Simulate data:
##D Sim <- simMLgvar(nTime = 50, nPerson = 20, nVar = 3)
##D 
##D # Estimate model:
##D Res <- mlGraphicalVAR(Sim$data, vars = Sim$vars, idvar = Sim$idvar)
##D 
##D layout(t(1:2))
##D library("qgraph")
##D 
##D # Temporal fixed effects
##D qgraph(Res$fixedPDC, title = "Estimated fixed PDC", layout = "circle")
##D qgraph(Sim$fixedPDC, title = "Simulated fixed PDC", layout = "circle")
##D 
##D # Contemporaneous fixed effects
##D qgraph(Res$fixedPCC, title = "Estimated fixed PCC", layout = "circle")
##D qgraph(Sim$fixedPCC, title = "Simulated fixed PCC", layout = "circle")
## End(Not run)



