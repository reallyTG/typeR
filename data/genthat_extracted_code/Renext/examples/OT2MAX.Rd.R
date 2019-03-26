library(Renext)


### Name: OT2MAX
### Title: Temporal aggregation of a Marked Process
### Aliases: OT2MAX

### ** Examples

## use Dunkerque data
OTdata <- Dunkerque$OTdata; OTmissing <- Dunkerque$OTmissing
## allow up to 50% gap in a block, or only 5%
MAX1 <- OT2MAX(OTdata = OTdata, OTmissing = OTmissing,
               maxMissingFrac = 0.5,
               main = "impact of the 'maxMissingFrac' formal")
MAX2 <- OT2MAX(OTdata = OTdata, OTmissing = OTmissing, dataFrames = TRUE,
               prefix = "Max", maxMissingFrac = 0.05, plot = FALSE)
lines(MAX2$MAXdata$date, MAX2$MAXdata$Surge, type = "h", col = "red", lwd = 3)
legend("topleft", lw = c(1, 3), col = c("black", "orangered"),
       legend = c("50% max", " 5% max"))

## r-largest obs for r = 4
MAX3 <- OT2MAX(OTdata, OTmissing = OTmissing, MAX.r = 4,
               maxMissingFrac = 0.9, 
               dataFrames = FALSE, trace = TRUE,
               main = "r-largest with r = 4")

## restrict the period
MAX4 <- OT2MAX(OTdata, OTmissing = OTmissing, MAX.r = 4,
               start = "1962-01-01",
               end = "1990-01-01",
               maxMissingFrac = 0.9, 
               dataFrames = FALSE, trace = TRUE,
               main = "r-largest with r = 4 with given 'start' and 'end'")
## Not run: 
##D   ## use in a block maxima analysis, as if there were no gaps.
##D   fit <- fGEV.MAX(MAX.data = MAX3$data,
##D                   MAX.effDuration = rep(1, length(MAX3$effDuration)))     
## End(Not run)
## plot the gap rate
MAX5 <- OT2MAX(OTdata = OTdata, OTmissing = OTmissing,
               maxMissingFrac = 0.5,
               main = "probability of being in a  gap",
               plotType = "gap")

## time series plot (only <= 10 months)
plot(MAX5$monthGapTS[ , c(1:4)], main = "gap rate by month")

## much better with lattice.
## Not run: 
##D     require(lattice)
##D     xyplot(MAX5$monthGapTS)
## End(Not run)



