library(DJL)


### Name: dm.mahalanobis
### Title: Distance measure using Mahalanobis distance for outlier
###   detection
### Aliases: dm.mahalanobis

### ** Examples

# Generate a sample dataframe
df <- data.frame(replicate(6, sample(0 : 100, 50)))

# go
dm.mahalanobis(df, plot = TRUE)



