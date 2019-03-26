library(quanteda)


### Name: dfm_weight
### Title: Weight the feature frequencies in a dfm
### Aliases: dfm_weight dfm_smooth
### Keywords: dfm

### ** Examples

my_dfm <- dfm(data_corpus_inaugural)

x <- apply(my_dfm, 1, function(tf) tf/max(tf))
topfeatures(my_dfm)
norm_dfm <- dfm_weight(my_dfm, "prop")
topfeatures(norm_dfm)
max_tf_dfm <- dfm_weight(my_dfm)
topfeatures(max_tf_dfm)
log_tf_dfm <- dfm_weight(my_dfm, scheme = "logcount")
topfeatures(log_tf_dfm)
log_ave_dfm <- dfm_weight(my_dfm, scheme = "logave")
topfeatures(log_ave_dfm)

# combine these methods for more complex dfm_weightings, e.g. as in Section 6.4
# of Introduction to Information Retrieval
head(dfm_tfidf(my_dfm, scheme_tf = "logcount"))

# apply numeric weights
str <- c("apple is better than banana", "banana banana apple much better")
(my_dfm <- dfm(str, remove = stopwords("english")))
dfm_weight(my_dfm, weights = c(apple = 5, banana = 3, much = 0.5))

## Don't show: 
testdfm <- dfm(data_corpus_inaugural[1:5])
for (w in  c("count", "prop", "propmax", "logcount", "boolean", "augmented", "logave")) {
    testw <- dfm_weight(testdfm, w)
    cat("\n\n=== weight() TEST for:", w, "; class:", class(testw), "\n")
    head(testw)
}
## End(Don't show)
# smooth the dfm
dfm_smooth(my_dfm, 0.5)



