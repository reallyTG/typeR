## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", warning = FALSE
)

## ------------------------------------------------------------------------
library(textmineR)

# load movie_review dataset from text2vec
data(movie_review, package = "text2vec")

str(movie_review)

# let's take a sample so the demo will run quickly
# note: textmineR is generally quite scaleable, depending on your system
set.seed(123)
s <- sample(1:nrow(movie_review), 500)

movie_review <- movie_review[ s , ]

# create a document term matrix 
dtm <- CreateDtm(doc_vec = movie_review$review, # character vector of documents
                 doc_names = movie_review$id, # document names, optional
                 ngram_window = c(1, 2), # minimum and maximum n-gram length
                 stopword_vec = c(stopwords::stopwords("en"), # stopwords from tm
                                  stopwords::stopwords(source = "smart")), # this is the default value
                 lower = TRUE, # lowercase - this is the default value
                 remove_punctuation = TRUE, # punctuation - this is the default
                 remove_numbers = TRUE, # numbers - this is the default
                 verbose = FALSE, # Turn off status bar for this demo
                 cpus = 2) # by default, this will be the max number of cpus available


## ------------------------------------------------------------------------
dim(dtm) 

nrow(dtm) 

ncol(dtm) 

## ------------------------------------------------------------------------
head(colnames(dtm))

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(colnames(dtm)), col.names = "colnames(dtm)") # tokens

## ----eval = FALSE--------------------------------------------------------
#  head(rownames(dtm))

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(rownames(dtm)), col.names = "rownames(dtm)") # document IDs


## ------------------------------------------------------------------------

# get counts of tokens across the corpus
tf_mat <- TermDocFreq(dtm = dtm)

str(tf_mat) 


## ----eval = FALSE--------------------------------------------------------
#  # look at the most frequent tokens
#  head(tf_mat[ order(tf_mat$term_freq, decreasing = TRUE) , ], 10)
#  

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_mat[ order(tf_mat$term_freq, decreasing = TRUE) , ], 10),
             caption = "Ten most frequent tokens")


## ------------------------------------------------------------------------
# look at the most frequent bigrams
tf_bigrams <- tf_mat[ stringr::str_detect(tf_mat$term, "_") , ]


## ----eval = FALSE--------------------------------------------------------
#  head(tf_bigrams[ order(tf_bigrams$term_freq, decreasing = TRUE) , ], 10)

## ----echo = FALSE--------------------------------------------------------

knitr::kable(head(tf_bigrams[ order(tf_bigrams$term_freq, decreasing = TRUE) , ], 10),
             caption = "Ten most frequent bi-grams")


## ------------------------------------------------------------------------
# remove offending tokens from the DTM
dtm <- dtm[ , ! stringr::str_detect(colnames(dtm),
                                    "(^br$)|(_br$)|(^br_)") ]

# re-construct tf_mat and tf_bigrams
tf_mat <- TermDocFreq(dtm)

tf_bigrams <- tf_mat[ stringr::str_detect(tf_mat$term, "_") , ]


## ------------------------------------------------------------------------
head(tf_mat[ order(tf_mat$term_freq, decreasing = TRUE) , ], 10)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_mat[ order(tf_mat$term_freq, decreasing = TRUE) , ], 10),
             caption = "Ten most frequent terms, '\\<br\\>' removed")


## ----eval = FALSE--------------------------------------------------------
#  head(tf_bigrams[ order(tf_bigrams$term_freq, decreasing = TRUE) , ], 10)

## ----echo = FALSE--------------------------------------------------------

knitr::kable(head(tf_bigrams[ order(tf_bigrams$term_freq, decreasing = TRUE) , ], 10),
             caption = "Ten most frequent bi-grams, '\\<br\\>' removed")

## ------------------------------------------------------------------------
# summary of document lengths
doc_lengths <- rowSums(dtm)

summary(doc_lengths)

## ------------------------------------------------------------------------
# remove any tokens that were in 3 or fewer documents
dtm <- dtm[ , colSums(dtm > 0) > 3 ] # alternatively: dtm[ , tf_mat$term_freq > 3 ]

tf_mat <- tf_mat[ tf_mat$term %in% colnames(dtm) , ]

tf_bigrams <- tf_bigrams[ tf_bigrams$term %in% colnames(dtm) , ]


## ------------------------------------------------------------------------
# what words are most associated with sentiment?
tf_sentiment <- list(positive = TermDocFreq(dtm[ movie_review$sentiment == 1 , ]),
                     negative = TermDocFreq(dtm[ movie_review$sentiment == 0 , ]))

## ----eval = FALSE--------------------------------------------------------
#  head(tf_sentiment$positive[ order(tf_sentiment$positive$term_freq, decreasing = TRUE) , ], 10)
#  

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment$positive[ order(tf_sentiment$positive$term_freq, decreasing = TRUE) , ], 10)
, caption = "Ten most-frequent positive tokens")

## ----eval = FALSE--------------------------------------------------------
#  head(tf_sentiment$negative[ order(tf_sentiment$negative$term_freq, decreasing = TRUE) , ], 10)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment$negative[ order(tf_sentiment$negative$term_freq, decreasing = TRUE) , ], 10), caption = "Ten most-frequent negative tokens")

## ------------------------------------------------------------------------

# let's reweight by probability by class
p_words <- colSums(dtm) / sum(dtm) # alternatively: tf_mat$term_freq / sum(tf_mat$term_freq)

tf_sentiment$positive$conditional_prob <- 
  tf_sentiment$positive$term_freq / sum(tf_sentiment$positive$term_freq)

tf_sentiment$positive$prob_lift <- tf_sentiment$positive$conditional_prob - p_words

tf_sentiment$negative$conditional_prob <- 
  tf_sentiment$negative$term_freq / sum(tf_sentiment$negative$term_freq)

tf_sentiment$negative$prob_lift <- tf_sentiment$negative$conditional_prob - p_words

## ----eval = FALSE--------------------------------------------------------
#  # let's look again with new weights
#  head(tf_sentiment$positive[ order(tf_sentiment$positive$prob_lift, decreasing = TRUE) , ], 10)
#  

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment$positive[ order(tf_sentiment$positive$prob_lift, decreasing = TRUE) , ], 10), caption = "Reweighted: ten most relevant terms for positive sentiment")

## ----eval = FALSE--------------------------------------------------------
#  head(tf_sentiment$negative[ order(tf_sentiment$negative$prob_lift, decreasing = TRUE) , ], 10)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment$negative[ order(tf_sentiment$negative$prob_lift, decreasing = TRUE) , ], 10), caption = "Reweighted: ten most relevant terms for negative sentiment")

## ------------------------------------------------------------------------
# what about bi-grams?
tf_sentiment_bigram <- lapply(tf_sentiment, function(x){
  x <- x[ stringr::str_detect(x$term, "_") , ]
  x[ order(x$prob_lift, decreasing = TRUE) , ]
})

## ----eval = FALSE--------------------------------------------------------
#  head(tf_sentiment_bigram$positive, 10)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment_bigram$positive, 10),
             caption = "Reweighted: ten most relevant bigrams for positive sentiment")

## ----eval = FALSE--------------------------------------------------------
#  head(tf_sentiment_bigram$negative, 10)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(tf_sentiment_bigram$negative, 10),
             caption = "Reweighted: ten most relevant bigrams for negative sentiment")


