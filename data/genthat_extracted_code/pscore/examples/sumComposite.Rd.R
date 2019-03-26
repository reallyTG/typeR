library(pscore)


### Name: sumComposite
### Title: Score Data Using a simple sum
### Aliases: sumComposite

### ** Examples

# this example creates distances for the built in mtcars data
# see ?mtcars for more details
# The distances are calculated from the "best" in the dataset
# defined by these thresholds
thresholds <- with(mtcars, c(
  mpg = max(mpg),
  hp = max(hp),
  wt = min(wt),
  qsec = min(qsec)))

# higher mpg and hp are better,
# whereas lower wt and qsec are better
dres <- distanceScores(mtcars[, c("mpg", "hp", "wt", "qsec")],
  thresholds = list(thresholds),
  higherisbetter = c(TRUE, TRUE, FALSE, FALSE),
  saveall = TRUE)

# see a density plot of the distance scores
dres$Density

# now prepare to create the composite
# covariance matrix will be calculated from the data
# and data will be standardized to unit variance by default
cprep <- prepareComposite(dres)

# now we can create the composite based on summing the (standardized)
# distances from our defined thresholds
# by default, distances are squared, then summed, and then square rooted
# to be back on the original scale
scomp <- sumComposite(cprep, "square", "sum")

# view a histogram and summary of the composite scores
scomp$ScoreHistogram
summary(scomp$Scores)

# calculate average (mean) instead of sum
scomp2 <- sumComposite(cprep, "square", "mean")

# view a histogram and summary of the composite scores
scomp2$ScoreHistogram
summary(scomp2$Scores)

# scores are still the same
plot(scomp$Scores, scomp2$Scores)

# first average scores within a system, then sum
# note that within a system, scores are always averaged,
# never summed.
scomp3 <- sumComposite(cprep, "square", "sum",
  systems = list(
    environment = c("mpg"),
    performance = c("hp", "qsec", "wt")))

# view a histogram and summary of the composite scores
scomp3$ScoreHistogram
summary(scomp3$Scores)

# compare all three scores
# because of the different number of indicators within each system
# there is a re-weighting for S3
plot(data.frame(S1 = scomp$Scores, S2 = scomp2$Scores, S3 = scomp3$Scores))

# cleanup
rm(thresholds, dres, cprep, scomp, scomp2, scomp3)



