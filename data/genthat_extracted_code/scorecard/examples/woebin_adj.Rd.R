library(scorecard)


### Name: woebin_adj
### Title: WOE Binning Adjustment
### Aliases: woebin_adj

### ** Examples

## Not run: 
##D # Load German credit data
##D data(germancredit)
##D 
##D # Example I
##D dt = germancredit[, c("creditability", "age.in.years", "credit.amount")]
##D bins = woebin(dt, y="creditability")
##D breaks_adj = woebin_adj(dt, y="creditability", bins)
##D bins_final = woebin(dt, y="creditability",
##D                     breaks_list=breaks_adj)
##D 
##D # Example II
##D binsII = woebin(germancredit, y="creditability")
##D breaks_adjII = woebin_adj(germancredit, "creditability", binsII)
##D bins_finalII = woebin(germancredit, y="creditability",
##D                     breaks_list=breaks_adjII)
## End(Not run)




