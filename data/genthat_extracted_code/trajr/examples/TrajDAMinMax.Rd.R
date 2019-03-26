library(trajr)


### Name: TrajDAMinMax
### Title: First direction autocorrelation minimum/maximum
### Aliases: TrajDAMinMax TrajDAFindFirstMinimum TrajDAFindFirstMaximum

### ** Examples

set.seed(42)
trj <- TrajGenerate(600, angularErrorSd = 1)
smoothed <- TrajSmoothSG(trj, 3, 11)

# Resample to fixed path length
resampled <- TrajRediscretize(smoothed, 1)
# Calculate direction autocorrelation for resampled trajectory
corr <- TrajDirectionAutocorrelations(resampled, 100)
# Extract first local minimum from autocorrelation
minPt <- TrajDAFindFirstMinimum(corr, 20)

# Plot the autocorrelation function
plot(corr, type ='l')
# Plot a red dot with a black outline at the first minimum
points(minPt["deltaS"], minPt["C"], pch = 16, col = "red", lwd = 2)
points(minPt["deltaS"], minPt["C"], col = "black", lwd = 2)




