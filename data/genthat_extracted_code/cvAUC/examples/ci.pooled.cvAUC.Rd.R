library(cvAUC)


### Name: ci.pooled.cvAUC
### Title: Confidence Intervals for Cross-validated Area Under the ROC
###   Curve (AUC) Estimates for Pooled Repeated Measures Data
### Aliases: ci.pooled.cvAUC

### ** Examples

# This example is similar to the ci.cvAUC example, with the excpection that
# this is a pooled repeated measures data set.  The example uses simulated
# data that contains multiple time point observations for 500 patients, 
# each observation having a binary outcome.
# 
# The cross-validation folds are stratified by ids that have at least one 
# positive outcome.  All observations belonging to one patient are
# contained within the save CV fold.


pooled_example <- function(data, ids, V=10){

  .cvFolds <- function(Y, V, ids){
    #Stratify by outcome & id
    classes <- tapply(1:length(Y), INDEX=Y, FUN=split, 1)
    ids.Y1 <- unique(ids[classes$`1`])  #ids that contain an observation with Y==1
    ids.noY1 <- setdiff(unique(ids), ids.Y1)  #ids that have no Y==1 obvervations
    ids.Y1.split <- split(sample(length(ids.Y1)), rep(1:V, length=length(ids.Y1)))
    ids.noY1.split <- split(sample(length(ids.noY1)), rep(1:V, length=length(ids.noY1)))  
    folds <- vector("list", V)
    for (v in seq(V)){
      idx.Y1 <- which(ids %in% ids.Y1[ids.Y1.split[[v]]])
      idx.noY1 <- which(ids %in% ids.noY1[ids.noY1.split[[v]]])
      folds[[v]] <- c(idx.Y1, idx.noY1)
    }
    return(folds)
  }
  .doFit <- function(v, folds, data){  #Train/test glm for each fold
    fit <- glm(Y~., data=data[-folds[[v]],], family=binomial)
    pred <- predict(fit, newdata=data[folds[[v]],], type="response")
    return(pred)
  }
  folds <- .cvFolds(Y=data$Y, ids=ids, V=V)  #Create folds
  predictions <- unlist(sapply(seq(V), .doFit, folds=folds, data=data))  #CV train/predict
  predictions[unlist(folds)] <- predictions  #Re-order fold indices
  out <- ci.pooled.cvAUC(predictions=predictions, labels=data$Y, 
  folds=folds, ids=ids, confidence=0.95)
  return(out)
}


# Load data
library(cvAUC)
data(adherence)


# Get performance
set.seed(1)
out <- pooled_example(data=subset(adherence, select=-c(id)), ids=adherence$id, V=10)


# The output is given as follows:
# > out
# $cvAUC
# [1] 0.8648046
#
# $se
# [1] 0.01551888
#
# $ci
# [1] 0.8343882 0.8952211
#
# $confidence
# [1] 0.95





