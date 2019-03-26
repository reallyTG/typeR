library(NMAoutlier)


### Name: fwdplot
### Title: Forward plot(s) to monitor selected statistic(s)/method(s)
### Aliases: fwdplot
### Keywords: hplot

### ** Examples

data(smokingcessation, package = "netmeta")
smokingcessation$id <- 1:nrow(smokingcessation)

study912 <- subset(smokingcessation, id %in% 9:12)
p1 <- netmeta::pairwise(list(treat1, treat2, treat3),
                        list(event1, event2, event3),
                        list(n1, n2, n3),
                        data = study912,
                        sm = "OR")

# Forward search algorithm
#
FSresult <- NMAoutlier(p1, P = 1, small.values = "bad", n_cores = 2)

# forward plot for Cook's distance
fwdplot(FSresult, "cook")

## Not run: 
##D data(smokingcessation, package = "netmeta")
##D 
##D # Transform data from arm-based format to contrast-based format
##D # We use 'sm' argument for odds ratios.
##D # We use function pairwise from netmeta package
##D 
##D p1 <- netmeta::pairwise(list(treat1, treat2, treat3),
##D                         list(event1, event2, event3),
##D                         list(n1, n2, n3),
##D                         data=smokingcessation,
##D                         sm="OR")
##D 
##D # forward search algorithm
##D FSresult <- NMAoutlier(p1, small.values = "bad")
##D 
##D FSresult
##D 
##D # forward plot for Cook's distance
##D fwdplot(FSresult, "cook")
##D 
##D # forward plot for ratio of variances
##D fwdplot(FSresult, "ratio")
##D 
##D # forward plot for heterogeneity variance estimator
##D fwdplot(FSresult, "heterog")
##D 
##D # forward plot for Q statistics
##D fwdplot(FSresult, "Q")
##D 
##D # forward plot for P-scores
##D fwdplot(FSresult, "pscore")
##D 
##D # forward plot monitoring P-scores for treatment A
##D fwdplot(FSresult,"pscore", "A")
##D 
##D # forward plot for z-values of disagreement of direct and indirect evidence
##D fwdplot(FSresult, "nsplit")
##D 
##D # forward plot for z-values of disagreement of direct and indirect evidence
##D # monitoring treatment comparison A versus B
##D fwdplot(FSresult, "nsplit", "A:B")
##D 
##D # forward plot for standardized residuals for study 4
##D fwdplot(FSresult, "estand", 4)
## End(Not run)




