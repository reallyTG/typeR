library(BTM)


### Name: predict.BTM
### Title: Predict function for a Biterm Topic Model
### Aliases: predict.BTM

### ** Examples

library(udpipe)
data("brussels_reviews_anno", package = "udpipe")
x <- subset(brussels_reviews_anno, language == "nl")
x <- subset(x, xpos %in% c("NN", "NNP", "NNS"))
x <- x[, c("doc_id", "lemma")]
model  <- BTM(x, k = 5, iter = 5, trace = TRUE)
scores <- predict(model, newdata = x, type = "sum_b")
scores <- predict(model, newdata = x, type = "sub_w")
scores <- predict(model, newdata = x, type = "mix")
head(scores)



