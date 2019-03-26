library(bayou)


### Name: pars2simmap
### Title: Convert a bayou parameter list into a simmap formatted phylogeny
### Aliases: pars2simmap

### ** Examples

tree <- reorder(sim.bdtree(n=100), "postorder")

pars <- list(k=5, sb=c(195, 196, 184, 138, 153), loc=rep(0, 5), t2=2:6)
tr <- pars2simmap(pars, tree)
plotRegimes(tr$tree, col=tr$col)



