library(StatMeasures)


### Name: outliers
### Title: Identify outliers in a variable
### Aliases: outliers

### ** Examples

# Scores vector
scores <- c(1, 4, 7, 10, 566, 21, 25, 27, 32, 35,
            49, 60, 75, 23, 45, 86, 26, 38, 34, 223, -3)

# Identify the count of outliers and their index
ltOutliers <- outliers(vector = scores)
numOutliers <- ltOutliers$numOutliers
idxOutliers <- ltOutliers$idxOutliers
valOutliers <- scores[idxOutliers]



