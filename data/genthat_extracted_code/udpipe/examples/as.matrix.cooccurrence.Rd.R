library(udpipe)


### Name: as.matrix.cooccurrence
### Title: Convert the result of cooccurrence to a sparse matrix
### Aliases: as.matrix.cooccurrence

### ** Examples

data(brussels_reviews_anno)
## By document, which lemma's co-occur
x <- subset(brussels_reviews_anno, xpos %in% c("NN", "JJ") & language %in% "fr")
x <- cooccurrence(x, group = "doc_id", term = "lemma")
x <- as.matrix(x)
dim(x)
x[1:3, 1:3]



