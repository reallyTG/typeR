library(copBasic)


### Name: isCOP.RTI
### Title: Is a Copula Right-Tail Increasing
### Aliases: isCOP.RTI
### Keywords: copula (characteristics) copula (properties)

### ** Examples

## Not run: 
##D isCOP.RTI(cop=P, delta=0.01) # independence should be FALSE
##D # but function returns TRUE, note that same logic for isCOP.LTD returns FALSE.
##D isCOP.RTI(cop=PSP)                              # TRUE  : positive assoc.
##D isCOP.RTI(cop=PLACKETTcop, para=.15)            # FALSE : negative assoc. Plackett
##D isCOP.RTI(cop=PLACKETTcop, para=15)             # TRUE  : positive assoc. Plackett
##D isCOP.RTI(cop=PLACKETTcop, wrtv=TRUE, para=.15) # FALSE : negative assoc. Plackett
##D isCOP.RTI(cop=PLACKETTcop, wrtV=TRUE, para=15)  # TRUE  : positive assoc. Plackett
## End(Not run)



