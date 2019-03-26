library(BTM)


### Name: BTM
### Title: Construct a Biterm Topic Model on Short Text
### Aliases: BTM

### ** Examples

library(udpipe)
data("brussels_reviews_anno", package = "udpipe")
x <- subset(brussels_reviews_anno, language == "nl")
x <- subset(x, xpos %in% c("NN", "NNP", "NNS"))
x <- x[, c("doc_id", "lemma")]
model  <- BTM(x, k = 5, alpha = 1, beta = 0.01, iter = 10, trace = TRUE)
model
terms(model)
scores <- predict(model, newdata = x)

## Another small run with first topic the background word distribution
set.seed(123456)
model  <- BTM(x, k = 5, beta = 0.01, iter = 10, background = TRUE)
model
terms(model)



