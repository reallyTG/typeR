library(mlearning)


### Name: confusion
### Title: Construct and analyze confusion matrices
### Aliases: confusion confusion.default confusion.mlearning
###   print.confusion summary.confusion print.summary.confusion
###   plot.confusion confusionImage confusionBarplot confusionStars
###   confusionDendrogram prior prior.confusion prior<- prior<-.confusion
### Keywords: tree

### ** Examples

data("Glass", package = "mlbench")
## Use a little bit more informative labels for Type
Glass$Type <- as.factor(paste("Glass", Glass$Type))

## Use learning vector quantization to classify the glass types
## (using default parameters)
summary(glassLvq <- mlLvq(Type ~ ., data = Glass))

## Calculate cross-validated confusion matrix and plot it in different ways
(glassConf <- confusion(cvpredict(glassLvq), Glass$Type))
## Raw confusion matrix: no sort and no margins
print(glassConf, sums = FALSE, sort = FALSE)
## Graphs
plot(glassConf) # Image by default
plot(glassConf, sort = FALSE) # No sorting
plot(glassConf, type = "barplot")
plot(glassConf, type = "stars")
plot(glassConf, type = "dendrogram")

summary(glassConf)
summary(glassConf, type = "Fscore")

## Build another classifier and make a comparison
summary(glassNaiveBayes <- mlNaiveBayes(Type ~ ., data = Glass))
(glassConf2 <- confusion(cvpredict(glassNaiveBayes), Glass$Type))

## Comparison plot for two classifiers
plot(glassConf, glassConf2)

## When the probabilities in each class do not match the proportions in the
## training set, all these calculations are useless. Having an idea of
## the real proportions (so-called, priors), one should first reweight the
## confusion matrix before calculating statistics, for instance:
prior1 <- c(10, 10, 10, 100, 100, 100) # Glass types 1-3 are rare
prior(glassConf) <- prior1
glassConf
summary(glassConf, type = c("Fscore", "Recall", "Precision"))
plot(glassConf)

## This is very different than if glass types 1-3 are abundants!
prior2 <- c(100, 100, 100, 10, 10, 10) # Glass types 1-3 are abundants
prior(glassConf) <- prior2
glassConf
summary(glassConf, type = c("Fscore", "Recall", "Precision"))
plot(glassConf)

## Weight can also be used to construct a matrix of relative frequencies
## In this case, all rows sum to one
prior(glassConf) <- 1
print(glassConf, digits = 2)
## However, it is easier to work with relative frequencies in percent
## and one gets a more compact presentation
prior(glassConf) <- 100
glassConf

## To reset row class frequencies to original propotions, just assign NULL
prior(glassConf) <- NULL
glassConf
prior(glassConf)



