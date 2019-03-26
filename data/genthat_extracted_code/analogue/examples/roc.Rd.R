library(analogue)


### Name: roc
### Title: ROC curve analysis
### Aliases: roc roc.default roc.mat roc.analog print.roc summary.roc
###   print.summary.roc
### Keywords: models multivariate methods

### ** Examples

## load the example data
data(swapdiat, swappH, rlgh)

## merge training and test set on columns
dat <- join(swapdiat, rlgh, verbose = TRUE)

## extract the merged data sets and convert to proportions
swapdiat <- dat[[1]] / 100
rlgh <- dat[[2]] / 100

## fit an analogue matching (AM) model using the squared chord distance
## measure - need to keep the training set dissimilarities
swap.ana <- analog(swapdiat, rlgh, method = "SQchord",
                   keep.train = TRUE)

## fit the ROC curve to the SWAP diatom data using the AM results
## Generate a grouping for the SWAP lakes
METHOD <- if (getRversion() < "3.1.0") {"ward"} else {"ward.D"}
clust <- hclust(as.dist(swap.ana$train), method = METHOD)
grps <- cutree(clust, 12)

## fit the ROC curve
swap.roc <- roc(swap.ana, groups = grps)
swap.roc

## draw the ROC curve
plot(swap.roc, 1)

## draw the four default diagnostic plots
layout(matrix(1:4, ncol = 2))
plot(swap.roc)
layout(1)



