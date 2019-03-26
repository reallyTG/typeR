library(tcR)


### Name: mutated.neighbours
### Title: Get vertex neighbours.
### Aliases: mutated.neighbours

### ** Examples

## Not run: 
##D data(twb)
##D twb.shared <- shared.repertoire(twb)
##D G <- mutation.network(twb.shared)
##D head(mutated.neighbours(G, 1)[[1]])
##D #           label             vseg repind prob people npeople
##D # 1 CASSDRDTGELFF          TRBV6-4      1   -1   1111       4
##D # 2 CASSDSDTGELFF          TRBV6-4     69   -1   1100       2
##D # 3 CASSYRDTGELFF TRBV6-3, TRBV6-2    315   -1   1001       2
##D # 4 CASKDRDTGELFF TRBV6-3, TRBV6-2   2584   -1   0100       1
##D # 5 CASSDGDTGELFF          TRBV6-4   5653   -1   0010       1
##D # 6 CASSDRETGELFF          TRBV6-4   5950   -1   0100       1
## End(Not run)



