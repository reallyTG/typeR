library(VCA)


### Name: getL
### Title: Construct Linear Contrast Matrix for Hypothesis Tests.
### Aliases: getL

### ** Examples

## Not run: 
##D data(dataEP05A2_2)
##D fit <- anovaMM(y~day/(run), dataEP05A2_2)
##D L <- getL(fit, c("day1-day2", "day5-day10"), what="fixef")
##D L
##D test.fixef(fit, L=L)
##D 
##D # another custom hypothesis
##D L2 <- getL(fit, "0.25*day1+0.25*day2+0.5*day3-0.5*day4-0.5*day5")
##D L2
##D 
##D # more complex model
##D data(VCAdata1)
##D dataS2 <- VCAdata1[VCAdata1$sample==2,]
##D fit.S2 <- anovaMM(y~(lot+device)/day/(run), dataS2)
##D L3 <- getL(fit.S2, c("lot1-lot2", "lot1:device3:day19-lot1:device3:day20", 
##D 						"lot1:device1:day1-lot1:device1:day2"))
##D L3
##D test.fixef(fit.S2, L3)
## End(Not run)



