library(surveillance)


### Name: bodaDelay
### Title: Bayesian Outbreak Detection in the Presence of Reporting Delays
### Aliases: bodaDelay

### ** Examples

## Not run: 
##D data("stsNewport")
##D salm.Normal <- list()
##D salmDelayAsym <- list()
##D for (week in 43:45){
##D   listWeeks <- as.Date(row.names(stsNewport@control$reportingTriangle$n), origin="1970-01-01")
##D   dateObs <- listWeeks[isoWeekYear(listWeeks)$ISOYear==2011 &
##D                        isoWeekYear(listWeeks)$ISOWeek==week]
##D   stsC <- sts_observation(stsNewport,
##D                           dateObservation=dateObs,
##D                           cut=TRUE)
##D   inWeeks <- which(formatDate(epoch(stsC), "%G") == 2011 & 
##D                      isoWeekYear(as.Date(epoch(stsC)))$ISOWeek>=40 & 
##D                      isoWeekYear(as.Date(epoch(stsC)))$ISOWeek<=48)
##D   
##D   rangeTest <- inWeeks
##D   alpha <- 0.07
##D 
##D   # Control slot for Noufaily method          
##D   controlNoufaily <- list(range=rangeTest,noPeriods=10,
##D                           b=4,w=3,weightsThreshold=2.58,pastWeeksNotIncluded=26,
##D                           pThresholdTrend=1,thresholdMethod="nbPlugin",alpha=alpha*2,
##D                           limit54=c(0,50))
##D   
##D   # Control slot for the Proposed algorithm with D=0 correction
##D   controlNormal <- list(range = rangeTest, b = 4, w = 3,
##D                         reweight = TRUE, mc.munu=10000, mc.y=100,
##D                         verbose = FALSE,
##D                         alpha = alpha, trend = TRUE,
##D                         limit54=c(0,50), 
##D                         noPeriods = 10, pastWeeksNotIncluded = 26,
##D                         delay=FALSE)
##D   
##D   # Control slot for the Proposed algorithm with D=10 correction
##D   controlDelayNorm <-  list(range = rangeTest, b = 4, w = 3,
##D                             reweight = FALSE, mc.munu=10000, mc.y=100,
##D                             verbose = FALSE,
##D                             alpha = alpha, trend = TRUE,
##D                             limit54=c(0,50), 
##D                             noPeriods = 10, pastWeeksNotIncluded = 26,
##D                             delay=TRUE,inferenceMethod="asym")
##D   
##D   set.seed(1)
##D   salm.Normal[[week]] <- farringtonFlexible(stsC, controlNoufaily)
##D   salmDelayAsym[[week]] <- bodaDelay(stsC, controlDelayNorm)
##D }
##D 
##D opar <- par(mfrow=c(2,3))
##D lapply(salmDelayAsym[c(43,44,45)],plot, legend=NULL, main="", ylim=c(0,35))
##D lapply(salm.Normal[c(43,44,45)],plot, legend=NULL, main="", ylim=c(0,35))
##D par(opar)
## End(Not run)



