## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------

# load the NIH data set
library(textmineR)

# load nih_sample data set from textmineR
data(nih_sample)

# First create a TCM using skip grams, we'll use a 5-word window
# most options available on CreateDtm are also available for CreateTcm
tcm <- CreateTcm(doc_vec = nih_sample$ABSTRACT_TEXT,
                 skipgram_window = 10,
                 verbose = FALSE,
                 cpus = 2)

# a TCM is generally larger than a DTM
dim(tcm)

## ------------------------------------------------------------------------
# use LDA to get embeddings into probability space
# This will take considerably longer as the TCM matrix has many more rows 
# than your average DTM
embeddings <- FitLdaModel(dtm = tcm,
                          k = 50,
                          iterations = 200,
                          burnin = 180,
                          alpha = 0.1,
                          beta = 0.05,
                          optimize_alpha = TRUE,
                          calc_likelihood = FALSE,
                          calc_coherence = TRUE,
                          calc_r2 = TRUE,
                          cpus = 2)

## ------------------------------------------------------------------------
# Get an R-squared for general goodness of fit
embeddings$r2

# Get coherence (relative to the TCM) for goodness of fit
summary(embeddings$coherence)

## ------------------------------------------------------------------------
# Get top terms, no labels because we don't have bigrams
embeddings$top_terms <- GetTopTerms(phi = embeddings$phi,
                                    M = 5)

## ------------------------------------------------------------------------
# Create a summary table, similar to the above
embeddings$summary <- data.frame(topic = rownames(embeddings$phi),
                                 coherence = round(embeddings$coherence, 3),
                                 prevalence = round(colSums(embeddings$theta), 2),
                                 top_terms = apply(embeddings$top_terms, 2, function(x){
                                   paste(x, collapse = ", ")
                                 }),
                                 stringsAsFactors = FALSE)


## ----eval = FALSE--------------------------------------------------------
#  embeddings$summary[ order(embeddings$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ]

## ----echo = FALSE--------------------------------------------------------
knitr::kable(embeddings$summary[ order(embeddings$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ], caption = "Summary of top 10 embedding dimensions")

## ----eval = FALSE--------------------------------------------------------
#  embeddings$summary[ order(embeddings$summary$coherence, decreasing = TRUE) , ][ 1:10 , ]

## ----echo = FALSE--------------------------------------------------------
knitr::kable(embeddings$summary[ order(embeddings$summary$coherence, decreasing = TRUE) , ][ 1:10 , ], caption = "Summary of 10 most coherent embedding dimensions")

## ------------------------------------------------------------------------
# Make a DTM from our documents
dtm_embed <- CreateDtm(doc_vec = nih_sample$ABSTRACT_TEXT,
                       doc_names = nih_sample$APPLICATION_ID,
                       ngram_window = c(1,1),
                       verbose = FALSE,
                       cpus = 2)

dtm_embed <- dtm_embed[,colSums(dtm_embed) > 2]

# Project the documents into the embedding space
embedding_assignments <- predict(embeddings, dtm_embed, method = "gibbs",
                                 iterations = 200, burnin = 180)

## ------------------------------------------------------------------------
# get a goodness of fit relative to the DTM
embeddings$r2_dtm <- CalcTopicModelR2(dtm = dtm_embed, 
                                      phi = embeddings$phi[,colnames(dtm_embed)], # line up vocabulary
                                      theta = embedding_assignments,
                                      cpus = 2)

embeddings$r2_dtm

# get coherence relative to DTM
embeddings$coherence_dtm <- CalcProbCoherence(phi = embeddings$phi[,colnames(dtm_embed)], # line up vocabulary
                                              dtm = dtm_embed)

summary(embeddings$coherence_dtm)

