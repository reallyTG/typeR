library(diveMove)


### Name: diveModel-class
### Title: Class "diveModel" for representing a model for identifying dive
###   phases
### Aliases: diveModel-class diveModel
### Keywords: classes

### ** Examples


showClass("diveModel")

## No test: 
## Too long for checks
## Continuing the Example from '?calibrateDepth':
utils::example("calibrateDepth", package="diveMove",
               ask=FALSE, echo=FALSE)
dcalib		# the 'TDRcalibrate' that was created

## Compare dive models for dive phase detection
diveNo <- 255
diveX <- as.data.frame(extractDive(dcalib, diveNo=diveNo))
diveX.m <- cbind(as.numeric(row.names(diveX[-c(1, nrow(diveX)), ])),
                 diveX$depth[-c(1, nrow(diveX))],
                 diveX$time[-c(1, nrow(diveX))])

## calibrateDepth() default unimodal regression. Number of inner knots is
## either 10 or the number of samples in the dive, whichever is larger.
(phases.uni <- diveMove:::.cutDive(diveX.m, smooth.par=0.2, knot.factor=20,
                                   dive.model="unimodal",
                                   descent.crit.q=0.01, ascent.crit.q=0))
## Smoothing spline model, using default smoothing parameter.
(phases.spl <- diveMove:::.cutDive(diveX.m, smooth.par=0.2, knot.factor=20,
                                   dive.model="smooth.spline",
                                   descent.crit.q=0.01, ascent.crit.q=0))
plotDiveModel(phases.spl,
              diveNo=paste(diveNo, ", smooth.par=", 0.2, sep=""))
plotDiveModel(phases.uni, diveNo=paste(diveNo))

## End(No test)




