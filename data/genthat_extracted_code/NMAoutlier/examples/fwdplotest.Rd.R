library(NMAoutlier)


### Name: fwdplotest
### Title: Forward plots of summary estimates
### Aliases: fwdplotest
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

# Forward plot for summary estimates for each treatment
# and their confidence intervals
fwdplotest(FSresult)
## Not run: 
##D data(smokingcessation, package = "netmeta")
##D 
##D # Transform data from arm-based format to contrast-based format
##D # We use 'sm' argument for odds ratios.
##D # We use function pairwise from netmeta package
##D #
##D p1 <- netmeta::pairwise(list(treat1, treat2, treat3),
##D                         list(event1, event2, event3),
##D                         list(n1, n2, n3),
##D                         data=smokingcessation,
##D                         sm="OR")
##D 
##D # forward search algorithm
##D FSresult <- NMAoutlier(p1, small.values = "bad")
##D 
##D # Forward plot for summary estimates for each treatment
##D # and their confidence intervals
##D fwdplotest(FSresult)
## End(Not run)




