library(sybilcycleFreeFlux)


### Name: cfFBA
### Title: cycle free flux
### Aliases: cfFBA lrFBA
### Keywords: cycle free flux loopless FBA

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(iAF1260)
model=iAF1260
fba=optimizeProb(model)
cfopt=cfFBA(model,wtflux=getFluxDist(fba),objVal=lp_obj(fba), retOptSol=FALSE)
llflx=cfopt$fluxes
flx=getFluxDist(fba)
## Not run: 
##D layout(matrix(c(1,2,3,1,2,3), 2, 3, byrow = TRUE))
##D hist(log10(abs(flx[abs(llflx-flx)>1e-3])),main="loop flux",col="lightblue")
##D hist(log10(abs(llflx[abs(llflx-flx)>1e-3])),main="after removing loops",col="orange")
##D hist(log10(abs(flx[abs(llflx-flx)<1e-3])),main="fluxes not in loops",col="lightgreen")
## End(Not run)
## The function is currently defined as
"cfFBA"



