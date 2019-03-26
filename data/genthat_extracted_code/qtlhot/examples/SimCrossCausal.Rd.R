library(qtlhot)


### Name: SimCrossCausal
### Title: Simulate Cross for Causal Tests
### Aliases: SimCrossCausal SimCrossIndep CMSTCross
### Keywords: utilities

### ** Examples

set.seed(987654321)
CMSTCross <- SimCrossCausal(n.ind = 100, 
  len = rep(100, 3), n.mar = 101,
  beta = rep(0.5, 2), add.eff = 1, dom.eff = 0, 
  sig2.1 = 0.4, sig2.2 = 0.1, eq.spacing = FALSE, 
  cross.type = "bc", normalize = TRUE)
CMSTCross <- calc.genoprob(CMSTCross, step = 1)
## Not run: 
##D save(CMSTCross, file = "CMSTCross.RData", compress = TRUE)
## End(Not run)



