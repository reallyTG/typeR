library(quanteda)


### Name: textplot_network
### Title: Plot a network of feature co-occurrences
### Aliases: textplot_network as.network.fcm as.igraph.fcm
### Keywords: textplot

### ** Examples

toks <- corpus_subset(data_corpus_irishbudget2010) %>%
    tokens(remove_punct = TRUE) %>%
    tokens_tolower() %>%
    tokens_remove(stopwords("english"), padding = FALSE)
myfcm <- fcm(toks, context = "window", tri = FALSE)
feat <- names(topfeatures(myfcm, 30))
fcm_select(myfcm, feat, verbose = FALSE) %>% 
    textplot_network(min_freq = 0.5)
fcm_select(myfcm, feat, verbose = FALSE) %>% 
    textplot_network(min_freq = 0.8)
fcm_select(myfcm, feat, verbose = FALSE) %>%
    textplot_network(min_freq = 0.8, vertex_labelcolor = rep(c('gray40', NA), 15))

# as.igraph
if (requireNamespace("igraph", quietly = TRUE)) {
    txt <- c("a a a b b c", "a a c e", "a c e f g")
    mat <- fcm(txt)
    as.igraph(mat, min_freq = 1, omit_isolated = FALSE)
}



