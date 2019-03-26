## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(textmineR)

# load nih_sample data set from textmineR
data(nih_sample)

str(nih_sample)

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

dtm <- dtm[,colSums(dtm) > 2]


## ------------------------------------------------------------------------

# Fit a Latent Dirichlet Allocation model
# note the number of topics is arbitrary here
# see extensions for more info

set.seed(12345)

model <- FitLdaModel(dtm = dtm, 
                     k = 20,
                     iterations = 200, # I usually recommend at least 500 iterations or more
                     burnin = 180,
                     alpha = 0.1,
                     beta = 0.05,
                     optimize_alpha = TRUE,
                     calc_likelihood = TRUE,
                     calc_coherence = TRUE,
                     calc_r2 = TRUE,
                     cpus = 2) 


## ------------------------------------------------------------------------

str(model)


## ------------------------------------------------------------------------

# R-squared 
# - only works for probabilistic models like LDA and CTM
model$r2

# log Likelihood (does not consider the prior) 
plot(model$log_likelihood, type = "l")

## ----fig.width = 7.5, fig.height = 4-------------------------------------
# probabilistic coherence, a measure of topic quality
# this measure can be used with any topic model, not just probabilistic ones
summary(model$coherence)

hist(model$coherence, 
     col= "blue", 
     main = "Histogram of probabilistic coherence")

## ------------------------------------------------------------------------
# Get the top terms of each topic
model$top_terms <- GetTopTerms(phi = model$phi, M = 5)

## ----eval = FALSE--------------------------------------------------------
#  head(t(model$top_terms)

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(head(t(model$top_terms)), 
             col.names = rep("", nrow(model$top_terms)))

## ------------------------------------------------------------------------
# Get the prevalence of each topic
# You can make this discrete by applying a threshold, say 0.05, for
# topics in/out of docuemnts. 
model$prevalence <- colSums(model$theta) / sum(model$theta) * 100

# prevalence should be proportional to alpha
plot(model$prevalence, model$alpha, xlab = "prevalence", ylab = "alpha")

# textmineR has a naive topic labeling tool based on probable bigrams
model$labels <- LabelTopics(assignments = model$theta > 0.05, 
                            dtm = dtm,
                            M = 1)

head(model$labels)

# put them together, with coherence into a summary table
model$summary <- data.frame(topic = rownames(model$phi),
                            label = model$labels,
                            coherence = round(model$coherence, 3),
                            prevalence = round(model$prevalence,3),
                            top_terms = apply(model$top_terms, 2, function(x){
                              paste(x, collapse = ", ")
                            }),
                            stringsAsFactors = FALSE)


## ----eval = FALSE--------------------------------------------------------
#  model$summary[ order(model$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ]

## ----echo = FALSE--------------------------------------------------------
knitr::kable(model$summary[ order(model$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ], caption = "Summary of 10 most prevalent topics")


## ----fig.width = 7.5, fig.height = 4-------------------------------------

# predictions with gibbs
assignments <- predict(model, dtm,
                       method = "gibbs", 
                       iterations = 200,
                       burnin = 180,
                       cpus = 2)

# predictions with dot
assignments_dot <- predict(model, dtm,
                           method = "dot")


# compare
barplot(rbind(assignments[10,], assignments_dot[10,]),
        col = c("red", "blue"), las = 2, beside = TRUE)
legend("topright", legend = c("gibbs", "dot"), col = c("red", "blue"), 
       fill = c("red", "blue"))

## ------------------------------------------------------------------------

# get a tf-idf matrix
tf_sample <- TermDocFreq(dtm)

tf_sample$idf[ is.infinite(tf_sample$idf) ] <- 0 # fix idf for missing words

tf_idf <- t(dtm / rowSums(dtm)) * tf_sample$idf

tf_idf <- t(tf_idf)

# Fit a Latent Semantic Analysis model
# note the number of topics is arbitrary here
# see extensions for more info
lsa_model <- FitLsaModel(dtm = tf_idf, 
                     k = 100)

# objects: 
# sv = a vector of singular values created with SVD
# theta = distribution of topics over documents
# phi = distribution of words over topics
# gamma = predition matrix, distribution of topics over words
# coherence = coherence of each topic
# data = data used to train model
str(lsa_model)

## ----fig.width = 7.5, fig.height = 4-------------------------------------
# probabilistic coherence, a measure of topic quality
# - can be used with any topic lsa_model, e.g. LSA

summary(lsa_model$coherence)

hist(lsa_model$coherence, col= "blue")

# Get the top terms of each topic
lsa_model$top_terms <- GetTopTerms(phi = lsa_model$phi, M = 5)

## ----eval = FALSE--------------------------------------------------------
#  head(t(lsa_model$top_terms))

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(t(lsa_model$top_terms)), 
             col.names = rep("", nrow(lsa_model$top_terms)))

## ------------------------------------------------------------------------

# Get the prevalence of each topic
# You can make this discrete by applying a threshold, say 0.05, for
# topics in/out of docuemnts. 
lsa_model$prevalence <- colSums(lsa_model$theta) / sum(lsa_model$theta) * 100

# textmineR has a naive topic labeling tool based on probable bigrams
lsa_model$labels <- LabelTopics(assignments = lsa_model$theta > 0.05, 
                            dtm = dtm,
                            M = 1)

## ----eval = FALSE--------------------------------------------------------
#  head(lsa_model$labels)

## ----echo = FALSE--------------------------------------------------------
knitr::kable(head(lsa_model$labels))


## ------------------------------------------------------------------------

# put them together, with coherence into a summary table
lsa_model$summary <- data.frame(topic = rownames(lsa_model$phi),
                            label = lsa_model$labels,
                            coherence = round(lsa_model$coherence, 3),
                            prevalence = round(lsa_model$prevalence,3),
                            top_terms = apply(lsa_model$top_terms, 2, function(x){
                              paste(x, collapse = ", ")
                            }),
                            stringsAsFactors = FALSE)

## ----eval = FALSE--------------------------------------------------------
#  lsa_model$summary[ order(lsa_model$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ]

## ----echo = FALSE--------------------------------------------------------
knitr::kable(lsa_model$summary[ order(lsa_model$summary$prevalence, decreasing = TRUE) , ][ 1:10 , ], caption = "Summary of 10 most prevalent LSA topics")


## ------------------------------------------------------------------------
# Get topic predictions for all 5,000 documents

# set up the assignments matrix and a simple dot product gives us predictions
lsa_assignments <- t(dtm / rowSums(dtm)) * tf_sample$idf

lsa_assignments <- t(lsa_assignments)

lsa_assignments <- predict(lsa_model, lsa_assignments)



## ----fig.width = 7.5, fig.height = 4-------------------------------------
# compare the "fit" assignments to the predicted ones
barplot(rbind(lsa_model$theta[ rownames(dtm)[ 1 ] , ],
              lsa_assignments[ rownames(dtm)[ 1 ] , ]), 
        las = 2,
        main = "Comparing topic assignments in LSA",
        beside = TRUE,
        col = c("red", "blue"))

legend("topleft", 
       legend = c("During fitting", "Predicted"),
       fill = c("red", "blue"))


## ----fig.width = 7.5, fig.height = 4-------------------------------------
# load a sample DTM
data(nih_sample_dtm)

# choose a range of k 
# - here, the range runs into the corpus size. Not recommended for large corpora!
k_list <- seq(10,85, by=15)

# you may want toset up a temporary directory to store fit models so you get 
# partial results if the process fails or times out. This is a trivial example, 
# but with a decent sized corpus, the procedure can take hours or days, 
# depending on the size of the data and complexity of the model.
# I suggest using the digest package to create a hash so that it's obvious this 
# is a temporary directory
model_dir <- paste0("models_", digest::digest(colnames(nih_sample_dtm), algo = "sha1"))

# Fit a bunch of LDA models
# even on this trivial corpus, it will a bit of time to fit all of these models
model_list <- TmParallelApply(X = k_list, FUN = function(k){

  m <- FitLdaModel(dtm = nih_sample_dtm, 
                   k = k, 
                   iterations = 200, 
                   burnin = 180,
                   alpha = 0.1,
                   beta = colSums(nih_sample_dtm) / sum(nih_sample_dtm) * 100,
                   optimize_alpha = TRUE,
                   calc_likelihood = FALSE,
                   calc_coherence = TRUE,
                   calc_r2 = FALSE,
                   cpus = 1)
  m$k <- k
  
  m
}, export= ls(), # c("nih_sample_dtm"), # export only needed for Windows machines
cpus = 2) 

# Get average coherence for each model
coherence_mat <- data.frame(k = sapply(model_list, function(x) nrow(x$phi)), 
                            coherence = sapply(model_list, function(x) mean(x$coherence)), 
                            stringsAsFactors = FALSE)


# Plot the result
# On larger (~1,000 or greater documents) corpora, you will usually get a clear peak
plot(coherence_mat, type = "o")
    


