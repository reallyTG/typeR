library(textmineR)


### Name: update.lda_topic_model
### Title: Update a Latent Dirichlet Allocation topic model with new data
### Aliases: update.lda_topic_model

### ** Examples

## Not run: 
##D # load a document term matrix
##D d1 <- nih_sample_dtm[1:50,]
##D 
##D d2 <- nih_sample_dtm[51:100,]
##D 
##D # fit a model
##D m <- FitLdaModel(d1, k = 10, 
##D                  iterations = 200, burnin = 175,
##D                  optimize_alpha = TRUE, 
##D                  calc_likelihood = FALSE,
##D                  calc_coherence = TRUE,
##D                  calc_r2 = FALSE)
##D 
##D # update an existing model by adding documents
##D m2 <- update(object = m,
##D              dtm = rbind(d1, d2),
##D              iterations = 200,
##D              burnin = 175)
##D              
##D # use an old model as a prior for a new model
##D m3 <- update(object = m,
##D              dtm = d2, # new documents only
##D              iterations = 200,
##D              burnin = 175)
##D              
##D # add topics while updating a model by adding documents
##D m4 <- update(object = m,
##D              dtm = rbind(d1, d2),
##D              additional_k = 3,
##D              iterations = 200,
##D              burnin = 175)
##D              
##D # add topics to an existing model
##D m5 <- update(object = m,
##D              dtm = d1, # this is the old data
##D              additional_k = 3,
##D              iterations = 200,
##D              burnin = 175)
##D 
## End(Not run)



