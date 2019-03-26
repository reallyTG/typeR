library(FD)


### Name: maxent
### Title: Estimating Probabilities via Maximum Entropy: Improved Iterative
###   Scaling
### Aliases: maxent
### Keywords: distribution math models

### ** Examples

# an unbiased 6-sided dice, with mean = 3.5
# what is the probability associated with each side,
# given this constraint?
maxent(3.5, 1:6)

# a biased 6-sided dice, with mean = 4
maxent(4, 1:6)

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
## End(Not run)



