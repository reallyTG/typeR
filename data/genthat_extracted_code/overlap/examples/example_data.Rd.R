library(overlap)


### Name: Example data
### Title: Times of 'capture' of large mammals
### Aliases: 'Example data' kerinci
### Keywords: datasets

### ** Examples

data(kerinci)
str(kerinci)
# Time is in days, ie. 0 to 1:
range(kerinci$Time)
# Convert to radians:
timeRad <- kerinci$Time * 2*pi

# Extract data for tiger and tapir for Zone3:
spsA <- timeRad[kerinci$Zone == 3 & kerinci$Sps == 'tiger']
spsB <- timeRad[kerinci$Zone == 3 & kerinci$Sps == 'tapir']

# Plot the data:
overlapPlot(spsA, spsB)  # Tapir are mainly nocturnal
overlapPlot(spsA, spsB, xcenter="midnight")
legend('topleft', c("Tiger", "Tapir"), lty=c(1, 2), col=c("black", "blue"), bty='n')

# Check sample sizes:
length(spsA)
length(spsB)
# If the smaller sample is less than 50, Dhat1 gives the best estimates, together with
# confidence intervals from a smoothed bootstrap with norm0 or basic0 confidence interval.

# Calculate estimates of overlap:
( Dhats <- overlapEst(spsA, spsB) )  # or just get Dhat1
( Dhats <- overlapEst(spsA, spsB, type="Dhat1") )

# Do smoothed bootstrap:
# Generate 999 data sets:
bsA <- resample(spsA, 999)
bsB <- resample(spsB, 999)
# Analyse with bootEst, estimating only Dhat1:
bs <- bootEst(bsA, bsB, type="Dhat1")  # Takes a while
mean(bs)


# Get confidence intervals:
bootCI(Dhats[1], bs)['norm0', ]
bootCI(Dhats[1], bs)['basic0', ]



