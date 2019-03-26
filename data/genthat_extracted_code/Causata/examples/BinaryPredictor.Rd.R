library(Causata)


### Name: BinaryPredictor
### Title: Univariate analysis for binary classification.
### Aliases: BinaryPredictor BinaryPredictor.factor BinaryPredictor.numeric
###   BinaryPredictor.data.frame BinaryPredictor.default
###   plot.BinaryPredictor print.BinaryPredictorList

### ** Examples

library(ggplot2)
data(diamonds)
# set a dependent variable that is TRUE when the price is above $5000
dv <- diamonds$price > 5000

# convert ordered to factor
diamonds$cut <- as.factor(as.character(diamonds$cut))
diamonds$color <- as.factor(as.character(diamonds$color))
diamonds$clarity <- as.factor(as.character(diamonds$clarity))

# evaluate diamond cut and carats, and generate a plot for each
bp.cut <- BinaryPredictor(diamonds$cut, dv)
plot(bp.cut)
bp.carat <- BinaryPredictor(diamonds$carat, dv)
plot(bp.carat)

# Evaluate all predictors, print summary to screen
# note that price does not have 100% predictive
# power since the discreatization boundary is not $5000.
# Using a sample of 10k records and 3 folds of cross validation
# for greater speed.
set.seed(98765)
idx <- sample.int(nrow(diamonds), 10000)
bpList <- BinaryPredictor(diamonds[idx, ], dv[idx], folds=3)
df.summary <- print(bpList)



