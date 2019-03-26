library(epiDisplay)


### Name: matchTab
### Title: Matched tabulation
### Aliases: matchTab
### Keywords: array

### ** Examples

.data <- infert
## Not run:

# matchTab(case, induced, stratum)
# Tabulation successful but OR not computed
# because 'induced' is not binary

## End(Not run)
attach(.data)
ia <- induced > 0  # any induced abortion
matchTab(case, ia, stratum)

# See also
clogit(case ~ ia + strata(stratum), data=infert)
detach(.data)
rm(list=ls())



