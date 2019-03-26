library(apTreeshape)


### Name: get_tree_beta
### Title: Beta parameter as a function of the proportion of remaining tips
### Aliases: get_tree_beta

### ** Examples

# With the field of bullets hypothesis

set.seed(813)
sampl.frac=seq(0.2,1,0.2)
Beta=get_tree_beta(epsilon=0.01, beta=-1, alpha=-1, N=20, sampl.frac=sampl.frac, ntree=3)

Beta_quantiles=sapply(1:nrow(Beta),function(x){quantile(Beta[x,],c(0.05,0.5,0.95))})

plot(1, type="n", xlab="Fraction of extinct species, p", ylab="Beta statistic", 
      ylim=c(-2,10), xlim=c(0,1))
polygon(c(1-sampl.frac, rev(1-sampl.frac)), c(Beta_quantiles[1,(1:length(sampl.frac))],
        rev(Beta_quantiles[3,(1:length(sampl.frac))])), border=NA, col=grey(0.7))
points(1-sampl.frac, Beta_quantiles[2,(1:length(sampl.frac))],t="l")


# With nonrandom extinctions

## Not run: 
##D set.seed(813)
##D sampl.frac=seq(0.2,1,0.2)
##D Beta=get_tree_beta(epsilon=0.01, beta=5, alpha=2, eta=2, N=20, 
##D                     sampl.frac=sampl.frac, ntree=3)
##D 
##D Beta_quantiles=sapply(1:nrow(Beta),function(x){quantile(Beta[x,],c(0.05,0.5,0.95))})
##D 
##D plot(1, type="n", xlab="Fraction of extinct species, p", 
##D       ylab="Beta statistic", ylim=c(-2,10), xlim=c(0,1))
##D polygon(c(1-sampl.frac, rev(1-sampl.frac)), 
##D       c(Beta_quantiles[1,(1:length(sampl.frac))], 
##D       rev(Beta_quantiles[3,(1:length(sampl.frac))])), border=NA, col=grey(0.7))
##D points(1-sampl.frac, Beta_quantiles[2,(1:length(sampl.frac))],t="l")
## End(Not run)





