library(ndl)


### Name: modelStatistics
### Title: Calculate a range of goodness of fit measures for an object
###   fitted with some multivariate statistical method that yields
###   probability estimates for outcomes.
### Aliases: modelStatistics
### Keywords: discriminative learning

### ** Examples

data(think)
think.ndl <- ndlClassify(Lexeme ~ Agent + Patient, data=think)
probs <- acts2probs(think.ndl$activationMatrix)$p
preds <- acts2probs(think.ndl$activationMatrix)$predicted
n.data <- nrow(think)
n.predictors <- nrow(think.ndl$weightMatrix) *
   ncol(think.ndl$weightMatrix)
modelStatistics(observed=think$Lexeme, predicted=preds, p.values=probs,
   n.data=n.data, n.predictors=n.predictors)



