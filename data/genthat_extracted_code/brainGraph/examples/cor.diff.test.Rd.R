library(brainGraph)


### Name: cor.diff.test
### Title: Calculate the p-value for differences in correlation
###   coefficients
### Aliases: cor.diff.test

### ** Examples

## Not run: 
##D kNumSubjs <- summary(covars$Group)
##D corr.diffs <- cor.diff.test(corrs[[1]][[1]]$R, corrs[[2]][[1]]$R,
##D                             kNumSubjs[1], kNumSubjs[2], alternative='two.sided')
##D edge.diffs <- t(sapply(which(corr.diffs$p < .05), function(x)
##D                        mapply('[[',
##D                               dimnames(corr.diffs$p),
##D                               arrayInd(x, dim(corr.diffs$p)))
##D                               ))
## End(Not run)



