library(BuyseTest)


### Name: BuyseRes-summary
### Title: Summary Method for Class "BuyseRes"
### Aliases: BuyseRes-summary summary,BuyseRes-method
### Keywords: BuyseRes-method summary

### ** Examples

dt <- simBuyseTest(1e2, n.strata = 3)

 ## Not run: 
##D  BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status) + Bin(toxicity), data=dt)
##D  
## End(Not run)
 ## Don't show: 
 BT <- BuyseTest(Treatment ~ TTE(eventtime, censoring = status) + Bin(toxicity), data=dt, n.resampling = 10, trace = 0)
 
## End(Don't show)
 summary(BT)
 summary(BT, percentage = FALSE)
 summary(BT, statistic = "winRatio")




