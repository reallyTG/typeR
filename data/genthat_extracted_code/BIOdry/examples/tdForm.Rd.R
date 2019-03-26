library(BIOdry)


### Name: tdForm
### Title: ltd formulas
### Aliases: tdForm

### ** Examples

## an ltd formula:
lev <- c('plot','tree')
tdeq <- tdForm(lev,log.t = TRUE)
tdeq
## (not run) only primary covariate:
tdeq1 <- tdForm(lev,prim.cov = TRUE)
tdeq1
##Multilevel data frame of tree-ring widths:
data(Prings05,envir = environment())
## removing two levels: 'plot' and 'tree' from the formula
tdea2 <- tdForm(Prings05, lev.rm = c('plot','tree'))
tdea2 <- tdForm(Prings05, lev.rm = 2:3)



