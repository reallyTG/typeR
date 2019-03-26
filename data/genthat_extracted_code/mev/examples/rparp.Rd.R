library(mev)


### Name: rparp
### Title: Simulation from R-Pareto processes
### Aliases: rparp

### ** Examples

rparp(n=10, riskf = "site", siteindex=2, d=3, param=2.5, model="log")
rparp(n=10, riskf = "min", d=3, param=2.5, model="neglog")
rparp(n=10, riskf = "max", d=4, param=c(0.2,0.1,0.9,0.5), model="bilog")
rparp(n=10, riskf = "sum", d=3, param=c(0.8,1.2,0.6, -0.5), model="sdir")
vario <- function(x, scale=0.5, alpha=0.8){ scale*x^alpha }
grid.loc <- as.matrix(expand.grid(runif(4), runif(4)))
rparp(n=10, riskf = "max", vario=vario,loc=grid.loc, model="br")



