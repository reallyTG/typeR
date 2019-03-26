library(copBasic)


### Name: footCOP
### Title: The Spearman Footrule of a Copula
### Aliases: footCOP
### Keywords: copula (characteristics) copula (properties)

### ** Examples

  footCOP(cop=PSP)                      # 0.3177662
# footCOP(cop=PSP, by.concordance=TRUE) # 0.3178025

## Not run: 
##D n <- 2000; UV <- simCOP(n=n, cop=GHcop, para=2.3, graphics=FALSE)
##D footCOP(para=UV, as.sample=TRUE)                  # 0.5594364 (sample version)
##D footCOP(cop=GHcop, para=2.3)                      # 0.5513380 (copula integration)
##D footCOP(cop=GHcop, para=2.3, by.concordance=TRUE) # 0.5513562 (concordance function)
##D # where the later issued warnings on the integration
## End(Not run)



