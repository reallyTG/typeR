library(simba)


### Name: pcol
### Title: Permuted Correlation (on strata)
### Aliases: pcol mantl plot.mantl
### Keywords: methods htest

### ** Examples

    
data(abis)

## calulcate soerensen of species data
abis.soer <- sim(abis.spec)
## calculate distance (Euclidean) regarding some disturbance 
## variables (feces counts)
abis.pert <- dist(abis.env[,19:25])
## are compositional similarity and dissimilarity of disturbance related?
pcol(abis.soer, abis.pert)
## the relationship is significant, but not very strong

## compare one resemblance matrix with several others
# we compare bray-curtis against this selection of indices:
indices <- c("soerensen", "jaccard", "ochiai", "mountford", "whittaker", 
"lande", "wilsonshmida", "cocogaston", "magurran", "harrison")
# we use mantl() inside a sapply call
t(sapply(indices, function(x) unlist(mantl(vegdist(abis.spec), sim(abis.spec, method=x))[3:5])))





