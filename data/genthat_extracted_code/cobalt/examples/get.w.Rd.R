library(cobalt)


### Name: get.w
### Title: Extract Weights from Preprocessing Objects
### Aliases: get.w get.w.matchit get.w.ps get.w.mnps get.w.iptw get.w.Match
###   get.w.CBPS get.w.ebalance get.w.optmatch get.w.weightit
###   get.w.designmatch

### ** Examples

## Not run: 
##D data("lalonde", package = "cobalt")
##D library("MatchIt"); library("WeightIt")
##D 
##D m.out <- matchit(treat ~ age + educ + race, data = lalonde) 
##D 
##D w.out <- weightit(treat ~ age + educ + race, data = lalonde,
##D                   estimand = "ATT")
##D 
##D bal.tab(treat ~ age + educ + race, data = lalonde,
##D         weights = data.frame(matched = get.w(m.out),
##D                              weighted = get.w(w.out)),
##D         method = c("matching", "weighting"), 
##D         estimand = "ATT")
## End(Not run)



