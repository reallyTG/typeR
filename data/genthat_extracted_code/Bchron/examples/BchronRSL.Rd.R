library(Bchron)


### Name: BchronRSL
### Title: Relative sea level rate (RSL) estimation
### Aliases: BchronRSL

### ** Examples

## No test: 
# Load in data
data(TestChronData)
data(TestRSLData)

# Run through Bchronology
RSLrun = Bchronology(ages=TestChronData$ages,
                     ageSds=TestChronData$ageSds,
                     positions=TestChronData$position,
                     positionThicknesses=TestChronData$thickness,
                     ids=TestChronData$id,
                     calCurves=TestChronData$calCurves,
                     predictPositions=TestRSLData$Depth,
                     jitterPositions = TRUE)

# Now run through BchronRSL
RSLrun2 = BchronRSL(RSLrun,RSLmean=TestRSLData$RSL,RSLsd=TestRSLData$Sigma,degree=3)

# Summarise it
summary(RSLrun2)

# Plot it
plot(RSLrun2)
## End(No test)



