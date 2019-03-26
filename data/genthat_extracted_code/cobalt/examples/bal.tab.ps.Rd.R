library(cobalt)


### Name: bal.tab.ps
### Title: Balance Statistics for twang Objects
### Aliases: bal.tab.ps bal.tab.mnps bal.tab.iptw bal.tab.ps.cont

### ** Examples

library(twang); data("lalonde", package = "cobalt")

## Not run: 
##D ## Using ps() for generalized boosted modeling
##D ps.out <- ps(treat ~ age + educ + married + race +
##D              nodegree + re74 + re75, data = lalonde, 
##D              stop.method = c("ks.mean", "es.mean"), 
##D              estimand = "ATT", verbose = FALSE)
##D bal.tab(ps.out, stop.method = "es.max", un = TRUE, 
##D         m.threshold = .1, disp.ks = TRUE)
## End(Not run)



