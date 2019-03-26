library(jmotif)


### Name: bags_to_tfidf
### Title: Computes a TF-IDF weight vectors for a set of word bags.
### Aliases: bags_to_tfidf

### ** Examples

bag1 = data.frame(
   "words" = c("this", "is", "a", "sample"),
   "counts" = c(1, 1, 2, 1),
   stringsAsFactors = FALSE
   )
bag2 = data.frame(
   "words" = c("this", "is", "another", "example"),
   "counts" = c(1, 1, 2, 3),
   stringsAsFactors = FALSE
   )
ll = list("bag1" = bag1, "bag2" = bag2)
tfidf = bags_to_tfidf(ll)



