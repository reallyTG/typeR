library(diversitree)


### Name: make.classe
### Title: Cladogenetic State change Speciation and Extinction Model
### Aliases: make.classe starting.point.classe
### Keywords: models

### ** Examples

## GeoSSE equivalence
## Same tree simulated in ?make.geosse
pars <- c(1.5, 0.5, 1.0, 0.7, 0.7, 2.5, 0.5)
names(pars) <- diversitree:::default.argnames.geosse()
set.seed(5)
phy <- tree.geosse(pars, max.t=4, x0=0)

lik.g <- make.geosse(phy, phy$tip.state)
pars.g <- c(1.5, 0.5, 1.0, 0.7, 0.7, 1.4, 1.3)
names(pars.g) <- argnames(lik.g)

lik.c <- make.classe(phy, phy$tip.state+1, 3)
pars.c <- 0 * starting.point.classe(phy, 3)
pars.c['lambda222'] <- pars.c['lambda112'] <- pars.g['sA']
pars.c['lambda333'] <- pars.c['lambda113'] <- pars.g['sB']
pars.c['lambda123'] <-  pars.g['sAB']
pars.c['mu2'] <- pars.c['q13'] <- pars.g['xA']
pars.c['mu3'] <- pars.c['q12'] <- pars.g['xB']
pars.c['q21'] <- pars.g['dA']
pars.c['q31'] <- pars.g['dB']

lik.g(pars.g)   # -175.7685
lik.c(pars.c)   # -175.7685



