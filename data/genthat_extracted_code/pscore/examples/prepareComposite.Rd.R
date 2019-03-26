library(pscore)


### Name: prepareComposite
### Title: Prepare data to have a composite calculated
### Aliases: prepareComposite

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
# cleanup
rm(thresholds, dres, cprep)



