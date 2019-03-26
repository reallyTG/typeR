library(EpiModel)


### Name: as.phylo.transmat
### Title: Convert transmat infection tree into a phylo object
### Aliases: as.phylo.transmat

### ** Examples

set.seed(10)
nw <- network.initialize(n = 100, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

est1 <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

param <- param.net(inf.prob = 0.5)
init <- init.net(i.num = 1)
control <- control.net(type = "SI", nsteps = 40, nsims = 1, verbose = FALSE,
                       use.pids = FALSE)

mod1 <- netsim(est1, param, init, control)
tm <- get_transmat(mod1)
tmPhylo <- as.phylo.transmat(tm)
plot(tmPhylo, show.node.label = TRUE,
              root.edge = TRUE,
              cex = 0.5)




