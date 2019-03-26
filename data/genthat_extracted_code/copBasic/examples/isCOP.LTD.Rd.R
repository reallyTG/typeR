library(copBasic)


### Name: isCOP.LTD
### Title: Is a Copula Left-Tail Decreasing
### Aliases: isCOP.LTD
### Keywords: copula (characteristics) copula (properties)

### ** Examples

## Not run: 
##D isCOP.LTD(cop=P, delta=0.01) # independence should be FALSE
##D # Positive association
##D isCOP.LTD(cop=PSP)                               # TRUE
##D # Negative association Plackett
##D isCOP.LTD(cop=PLACKETTcop, para=0.15)            # FALSE
##D # Positive association Plackett
##D isCOP.LTD(cop=PLACKETTcop, para=15)              # TRUE
##D # Negative association Plackett
##D isCOP.LTD(cop=PLACKETTcop, wrtv=TRUE, para=0.15) # FALSE
##D # Positive association Plackett
##D isCOP.LTD(cop=PLACKETTcop, wrtV=TRUE, para=15)   # TRUE
## End(Not run)



