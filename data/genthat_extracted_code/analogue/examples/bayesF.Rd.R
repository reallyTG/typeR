library(analogue)


### Name: bayesF
### Title: Bayes factors
### Aliases: bayesF print.bayesF plot.bayesF
### Keywords: univar methods

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

## calculate the Bayes factors of analogue and no-analogue
## (uses observed probabilities of analogue/no-analogue
swap.bayes <- bayesF(swap.roc)
swap.bayes

## plot the probability of analogue
plot(swap.bayes)

## Not run: 
##D ## calculate the Bayes factors of analogue and no-analogue
##D ## with prior probabilities c(0.5, 0.05)
##D swap.bayes2 <- bayesF(swap.roc, prior = c(0.5, 0.05))
##D swap.bayes
##D 
##D ## plot the probability of analogue
##D plot(swap.bayes2)
## End(Not run)



