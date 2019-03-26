library(NMAoutlier)


### Name: NMAoutlier
### Title: Forward search algorithm in network meta-analysis
### Aliases: NMAoutlier

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
##D                         data = smokingcessation,
##D                         sm = "OR")
##D 
##D # Forward search algorithm
##D #
##D FSresult1 <- NMAoutlier(p1, small.values = "bad")
##D 
##D # Basic set for each iteration of forward search algorithm
##D #
##D FSresult1$basic
##D 
##D # Forward search algorithm using the criteria (crit1, crit2)
##D # with the maximum of absolute likelihood contributions ("L")
##D #
##D FSresult2 <- NMAoutlier(p1, crit1 = "L", crit2 = "L",
##D                         small.values = "bad")
##D FSresult2
## End(Not run)




