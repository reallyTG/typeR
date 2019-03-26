library(geiger)


### Name: rjmcmc.bm
### Title: Bayesian sampling of shifts in trait evolution: relaxed Brownian
###   motion
### Aliases: rjmcmc.bm
### Keywords: models

### ** Examples

## No test: 
## GENERATE DATA: jump-diffusion
phy <- ladderize(sim.bdtree(n=200), right=FALSE)
r <- paste(sample(letters,9,replace=TRUE),collapse="")
defpar <- par(no.readonly=TRUE)


tmp <- ex.jumpsimulator(phy, jumps=10)
dat <- tmp$dat
hist <- tmp$hist

ex.traitgram(phy, hist, alpha=0) # plot history of trait change

## RUN ANALYSIS


## coda package is not a dependency of geiger
## but is very useful for evaluating mcmc runs
## library(coda)


rjmcmc.bm(phy,dat, prop.width=1.5, ngen=20000, samp=500, filebase=r,
          simple.start=TRUE, type="jump-bm")
outdir <- paste("jump-BM", r, sep=".")
ps <- load.rjmcmc(outdir)

dev.new()
plot(x=ps, par="jumps", burnin=0.25, legend=FALSE, show.tip=FALSE, type="fan", edge.width=2)
mm=match(phy$edge[,2],hist$descendant)
hist=hist[mm,]
edgelabels.auteur(text=NULL, pch=21, cex=hist$cex, bg=NA, col=ifelse(hist$cex>0, 1, NA), lty=2)
title("red (estimated); black (true jump size)", line=-5)
par(defpar)

dev.new()
## from the coda package
coda::autocorr.plot(ps$log, ask=dev.interactive())
plot(ps$log, ask=dev.interactive())

## GENERATE DATA: multi-rate diffusion
scl <- ex.ratesimulator(phy, min=12, show.tip=FALSE)
dat <- rTraitCont(scl)

## RUN ANALYSIS
rjmcmc.bm(phy, dat, prop.width=1.5, ngen=20000, samp=500, filebase=r, simple.start=TRUE, type="rbm")
outdir <- paste("relaxedBM", r, sep=".")
ps <- load.rjmcmc(outdir)
dev.new()
plot(x=ps, par="shifts", burnin=0.25, legend=TRUE, show.tip=FALSE, edge.width=2)

## PASTE UNCOMMENTED FOLLOWING LINE TO DROP DIRECTORIES CREATED BY RJMCMC
 # unlink(dir(pattern=paste(r)),recursive=TRUE)
## End(No test)



