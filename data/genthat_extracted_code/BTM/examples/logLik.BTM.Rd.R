library(BTM)


### Name: logLik.BTM
### Title: Get the likelihood of biterms in a BTM model
### Aliases: logLik.BTM

### ** Examples

library(udpipe)
data("brussels_reviews_anno", package = "udpipe")
x <- subset(brussels_reviews_anno, language == "nl")
x <- subset(x, xpos %in% c("NN", "NNP", "NNS"))
x <- x[, c("doc_id", "lemma")]

model  <- BTM(x, k = 5, iter = 5, trace = TRUE)
fit <- logLik(model)
fit$ll



