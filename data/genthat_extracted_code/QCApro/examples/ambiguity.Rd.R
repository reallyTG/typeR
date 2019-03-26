library(QCApro)


### Name: ambiguity
### Title: Analyze the Degree of Ambiguity across Research Design
###   Variations
### Aliases: ambiguity
### Keywords: functions

### ** Examples

## Not run: 
##D # load dataset
##D data(d.tumorscreen)
##D 
##D # designs: outcomes HPF and LPF; all 3 to 5-tuples of exogenous factors
##D designs <- ambiguity(d.tumorscreen, outcome = c("HPF", "LPF"), 
##D   neg.out = c(FALSE, TRUE), tuples = 3:5)
##D 
##D # share of solutions with ambiguities
##D mapply(function (x) round(colSums((x > 1)) / nrow(x), 2), designs$n.models)
## End(Not run)



