library(secr)


### Name: addTelemetry
### Title: Combine Telemetry and Detection Data
### Aliases: addTelemetry xy2CH telemetrytype telemetrytype<-
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D # Generate some detection and telemetry data, combine them using
##D # addTelemetry, and perform analyses
##D 
##D # detectors
##D te <- make.telemetry()
##D tr <- make.grid(detector = "proximity")
##D 
##D # simulated population and 50% telemetry sample
##D totalpop <- sim.popn(tr, D = 20, buffer = 100)
##D tepop <- subset(totalpop, runif(nrow(totalpop)) < 0.5)
##D 
##D # simulated detection histories and telemetry
##D # the original animalID (renumber = FALSE) are needed for matching
##D trCH <- sim.capthist(tr,  popn = totalpop, renumber = FALSE, detectfn = "HHN")
##D teCH <- sim.capthist(te, popn = tepop, renumber=FALSE, detectfn = "HHN",
##D     detectpar = list(lambda0 = 3, sigma = 25))
##D 
##D combinedCH <- addTelemetry(trCH, teCH)
##D 
##D # summarise and display
##D summary(combinedCH)
##D plot(combinedCH, border = 150)
##D ncapt <- apply(combinedCH,1,sum)
##D points(totalpop[row.names(combinedCH)[ncapt==0],], pch = 1)
##D points(totalpop[row.names(combinedCH)[ncapt>0],], pch = 16)
##D 
##D # for later comparison of precison we must fix the habitat mask
##D mask <- make.mask(tr, buffer = 100)
##D fit.tr <- secr.fit(trCH, mask = mask, CL = TRUE, detectfn = "HHN")  ## trapping alone
##D fit.te <- secr.fit(teCH, mask = mask, CL = TRUE, start = log(20),   ## telemetry alone
##D     detectfn = "HHN") 
##D fit2   <- secr.fit(combinedCH, mask = mask, CL = TRUE,              ## combined
##D     detectfn = "HHN")                                 
##D 
##D # improved precision when focus on realised population
##D # (compare CVD)
##D derived(fit.tr, distribution = "binomial")
##D derived(fit2, distribution = "binomial")
##D 
##D 
##D # may also use CL = FALSE
##D secr.fit(combinedCH, CL = FALSE, detectfn = "HHN", trace = FALSE)
## End(Not run)




