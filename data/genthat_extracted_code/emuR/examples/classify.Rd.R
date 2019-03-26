library(emuR)


### Name: classify
### Title: classify
### Aliases: classify
### Keywords: models

### ** Examples



## The function is currently defined as
function (data, train, metric = "bayes") 
{
    probs <- distance(data, train, metric = metric)
    if (metric == "bayes") {
        best <- apply(probs, 1, max)
    }
    else if (metric == "mahal") {
        best <- apply(probs, 1, min)
    }
    result <- rep("", length(best))
    for (lab in 1:length(train$label)) {
        tmp <- probs[, lab] == best
        result[tmp] <- train$label[lab]
    }
    result
  }




