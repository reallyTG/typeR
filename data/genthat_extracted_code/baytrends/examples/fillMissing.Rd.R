library(baytrends)


### Name: fillMissing
### Title: Fill Missing Values
### Aliases: fillMissing
### Keywords: internal manip

### ** Examples

## Not run: 
##D #library(smwrData)
##D data(Q05078470)
##D # Create missing values in flow, the first sequence is a peak and the second is a recession
##D Q05078470$FlowMiss <- Q05078470$FLOW
##D Q05078470$FlowMiss[c(109:111, 198:201)] <- NA
##D # Interpolate the missing values
##D Q05078470$FlowFill <- fillMissing(Q05078470$FlowMiss)
##D # How did we do (line is actual, points are filled values)?
##D par(mfrow=c(2,1), mar=c(5.1, 4.1, 1.1, 1.1))
##D with(Q05078470[100:120, ], plot(DATES, FLOW, type="l"))
##D with(Q05078470[109:111, ], points(DATES, FlowFill))
##D with(Q05078470[190:210, ], plot(DATES, FLOW, type="l"))
##D with(Q05078470[198:201, ], points(DATES, FlowFill))
## End(Not run)



