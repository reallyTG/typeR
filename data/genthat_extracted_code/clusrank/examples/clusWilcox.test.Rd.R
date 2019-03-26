library(clusrank)


### Name: clusWilcox.test
### Title: Wilcoxon Rank Sum and Signed Rank Test for Clustered Data
### Aliases: clusWilcox.test clusWilcox.test.formula
###   clusWilcox.test.default

### ** Examples

## Clustered signed rank test using RGL method.
data(crsd)
clusWilcox.test(z, cluster = id, data = crsd, paired = TRUE, method = "rgl")
## or
clusWilcox.test(z ~ cluster(id), data = crsd, paired = TRUE, method = "rgl")
## Not run: 
##D clusWilcox.test(z, cluster = id, data = crsd)
##D ## Default is rank sum test. The group variable is required.
## End(Not run)
## Clustered rank sum test using RGL method.
data(crd)
clusWilcox.test(z ~ group + cluster(id), data = crd, method = "rgl")
## or
clusWilcox.test(z, cluster = id, group = group, data = crd, method = "rgl")



