library(mltools)


### Name: mcc
### Title: Matthews correlation coefficient
### Aliases: mcc

### ** Examples

preds <- c(1,1,1,0,1,1,0,0)
actuals <- c(1,1,1,1,0,0,0,0)
mcc(preds, actuals)
mcc(actuals, actuals)
mcc(TP=3, FP=2, TN=2, FN=1)

# Multiclass
preds <- data.frame(
  setosa = rnorm(n = 150), 
  versicolor = rnorm(n = 150), 
  virginica = rnorm(n = 150)
)
preds <- preds == apply(preds, 1, max)
actuals <- data.frame(
  setosa = rnorm(n = 150), 
  versicolor = rnorm(n = 150), 
  virginica = rnorm(n = 150)
)
actuals <- actuals == apply(actuals, 1, max)
mcc(preds = preds, actuals = actuals)

# Confusion matrix
mcc(confusionM = matrix(c(0,3,3,3,0,3,3,3,0), nrow = 3))
mcc(confusionM = matrix(c(1,0,0,0,1,0,0,0,1), nrow = 3))




