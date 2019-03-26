library(utiml)


### Name: multilabel_prediction
### Title: Create a mlresult object
### Aliases: multilabel_prediction

### ** Examples

probs <- matrix(
 runif(90), ncol=3, dimnames = list(1:30, c("y1", "y2", "y3"))
)
preds <- matrix(
 as.numeric(probs > 0.5), ncol=3, dimnames = list(1:30, c("y1", "y2", "y3"))
)
multilabel_prediction(probs, preds)



