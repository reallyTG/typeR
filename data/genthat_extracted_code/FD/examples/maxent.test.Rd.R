library(FD)


### Name: maxent.test
### Title: Inferential Permutation Tests for Maximum Entropy Models
### Aliases: maxent.test
### Keywords: distribution math models

### ** Examples


# example with tussock dataset
traits <- tussock$trait[, c(2:7, 11)] # use only continuous traits
traits <- na.omit(traits) # remove 2 species with NA's
abun <- tussock$abun[, rownames(traits)] # abundance matrix
abun <- t(apply(abun, 1, function(x) x / sum(x) )) # relative abundances
agg <- functcomp(traits, abun) # community-aggregated traits
traits <- t(traits) # transpose matrix

# run maxent on site 1 (first row of abun), all species
pred.abun <- maxent(agg[1,], traits)

## Not run: 
##D # do the constraints give predictive ability?
##D maxent.test(pred.abun, obs = abun[1,], nperm = 49)
##D 
##D # are height, LDMC, and leaf [N] important constraints?
##D maxent.test(pred.abun, obs = abun[1,], sub.c = c("height",
##D "LDMC", "leafN"), nperm = 49)
## End(Not run)



