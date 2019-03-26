library(BTM)


### Name: terms.BTM
### Title: Get highest token probabilities for each topic or get biterms
###   used in the model
### Aliases: terms.BTM

### ** Examples

library(udpipe)
data("brussels_reviews_anno", package = "udpipe")
x <- subset(brussels_reviews_anno, language == "nl")
x <- subset(x, xpos %in% c("NN", "NNP", "NNS"))
x <- x[, c("doc_id", "lemma")]
model  <- BTM(x, k = 5, iter = 5, trace = TRUE)
terms(model)
terms(model, top_n = 10)
terms(model, threshold = 0.01, top_n = +Inf)
bi <- terms(model, type = "biterms")
str(bi)



