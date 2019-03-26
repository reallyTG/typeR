library(pscore)


### Name: mahalanobisComposite
### Title: Score Data Using the Mahalanobis Distance
### Aliases: mahalanobisComposite

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

# now we can create the composite based on mahalanobis distances
# from our defined thresholds
mcomp <- mahalanobisComposite(cprep)

# view a histogram of the composite scores
mcomp$ScoreHistogram

# summarize the composite scores
summary(mcomp$Scores)

# check the screeplot and loadings
mcomp$Screeplot
mcomp$LoadingGraph
# examine the loadings as a table
mcomp$LoadingTable

# one component is adequate to explain these data
# to be safe can pick first two and re-run model

# use only first two components
mcomp2 <- mahalanobisComposite(cprep, ncomponents = 2)

# view a histogram of the updated composite scores
mcomp2$ScoreHistogram

# summarize the composite scores
summary(mcomp2$Scores)

# compare using all versus two components
plot(mcomp$Scores, mcomp2$Scores)

# cleanup
rm(thresholds, dres, cprep, mcomp, mcomp2)



