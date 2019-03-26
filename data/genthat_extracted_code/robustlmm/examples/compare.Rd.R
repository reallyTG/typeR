library(robustlmm)


### Name: compare
### Title: Create comparison charts for multiple fits
### Aliases: compare getInfo getInfo.lmerMod getInfo.rlmerMod
###   print.xtable.comparison.table xtable.comparison.table
### Keywords: models utilities

### ** Examples

## Not run: 
##D   fm1 <- lmer(Yield ~ (1|Batch), Dyestuff)
##D   fm2 <- rlmer(Yield ~ (1|Batch), Dyestuff)
##D   compare(fm1, fm2)
##D   require(xtable)
##D   xtable(compare(fm1, fm2))
##D   str(getInfo(fm1))
## End(Not run)



