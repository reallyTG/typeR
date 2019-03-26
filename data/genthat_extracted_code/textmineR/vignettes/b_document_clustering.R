## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", warning = FALSE
)

## ------------------------------------------------------------------------
library(textmineR)

# load nih_sample data set from textmineR
data(nih_sample)

# create a document term matrix 
dtm <- CreateDtm(doc_vec = nih_sample$ABSTRACT_TEXT, # character vector of documents
                 doc_names = nih_sample$APPLICATION_ID, # document names
                 ngram_window = c(1, 2), # minimum and maximum n-gram length
                 stopword_vec = c(stopwords::stopwords("en"), # stopwords from tm
                                  stopwords::stopwords(source = "smart")), # this is the default value
                 lower = TRUE, # lowercase - this is the default value
                 remove_punctuation = TRUE, # punctuation - this is the default
                 remove_numbers = TRUE, # numbers - this is the default
                 verbose = FALSE, # Turn off status bar for this demo
                 cpus = 2) # default is all available cpus on the system

# construct the matrix of term counts to get the IDF vector
tf_mat <- TermDocFreq(dtm)


## ------------------------------------------------------------------------

# TF-IDF and cosine similarity
tfidf <- t(dtm[ , tf_mat$term ]) * tf_mat$idf

tfidf <- t(tfidf)


## ------------------------------------------------------------------------

csim <- tfidf / sqrt(rowSums(tfidf * tfidf))

csim <- csim %*% t(csim)


## ------------------------------------------------------------------------

cdist <- as.dist(1 - csim)


## ----fig.width = 7.5, fig.height = 4-------------------------------------

hc <- hclust(cdist, "ward.D")

clustering <- cutree(hc, 10)

plot(hc, main = "Hierarchical clustering of 100 NIH grant abstracts",
     ylab = "", xlab = "", yaxt = "n")

rect.hclust(hc, 10, border = "red")


## ----documnet_clustering_5-----------------------------------------------
p_words <- colSums(dtm) / sum(dtm)

cluster_words <- lapply(unique(clustering), function(x){
  rows <- dtm[ clustering == x , ]
  
  # for memory's sake, drop all words that don't appear in the cluster
  rows <- rows[ , colSums(rows) > 0 ]
  
  colSums(rows) / sum(rows) - p_words[ colnames(rows) ]
})


## ------------------------------------------------------------------------
# create a summary table of the top 5 words defining each cluster
cluster_summary <- data.frame(cluster = unique(clustering),
                              size = as.numeric(table(clustering)),
                              top_words = sapply(cluster_words, function(d){
                                paste(
                                  names(d)[ order(d, decreasing = TRUE) ][ 1:5 ], 
                                  collapse = ", ")
                              }),
                              stringsAsFactors = FALSE)


## ----eval = FALSE--------------------------------------------------------
#  cluster_summary

## ----echo = FALSE--------------------------------------------------------
knitr::kable(cluster_summary, caption = "Cluster summary table")

## ----eval = FALSE--------------------------------------------------------
#  # plot a word cloud of one cluster as an example
#  wordcloud::wordcloud(words = names(cluster_words[[ 5 ]]),
#                       freq = cluster_words[[ 5 ]],
#                       max.words = 50,
#                       random.order = FALSE,
#                       colors = c("red", "yellow", "blue"),
#                       main = "Top words in cluster 100")

## ----echo = FALSE, warning = FALSE, fit.height = 7.5, fig.width = 7.5----
# plot a word cloud of one cluster as an example
suppressWarnings({
  wordcloud::wordcloud(words = names(cluster_words[[ 5 ]]), 
                     freq = cluster_words[[ 5 ]], 
                     max.words = 50, 
                     random.order = FALSE, 
                     colors = c("red", "yellow", "blue"),
                     main = "Top words in cluster 100")
})


