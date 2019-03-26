library(analogue)


### Name: logitreg
### Title: Logistic regression models for assessing analogues/non-analogues
### Aliases: logitreg logitreg.default logitreg.analog print.logitreg
###   summary.logitreg print.summary.logitreg
### Keywords: methods

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
grps <- cutree(clust, 6)

## fit the logit models to the analog object
swap.lrm <- logitreg(swap.ana, grps)
swap.lrm

## summary statistics
summary(swap.lrm)

## plot the fitted logit curves
plot(swap.lrm, conf.type = "polygon")

## extract fitted posterior probabilities for training samples
## for the individual groups
fit <- fitted(swap.lrm)
head(fit)

## compute posterior probabilities of analogue-ness for the rlgh
## samples. Here we take the dissimilarities between fossil and
## training samples from the `swap.ana` object rather than re-
## compute them
pred <- predict(swap.lrm, newdata = swap.ana$analogs)
head(pred)

## Bias reduction
## fit the logit models to the analog object
swap.brlrm <- logitreg(swap.ana, grps, biasReduced = TRUE)
summary(swap.brlrm)



