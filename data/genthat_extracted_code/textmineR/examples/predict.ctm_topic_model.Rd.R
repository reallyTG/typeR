library(textmineR)


### Name: predict.ctm_topic_model
### Title: Predict method for Correlated topic models (CTM)
### Aliases: predict.ctm_topic_model

### ** Examples

# Load a pre-formatted dtm 
## Not run: 
##D data(nih_sample_dtm) 
##D 
##D model <- FitCtmModel(dtm = nih_sample_dtm[1:20,], k = 3,
##D                      calc_coherence = FALSE, calc_r2 = FALSE)
##D 
##D # Get predictions on the next 50 documents
##D pred <- predict(model, nih_sample_dtm[21:100,])
## End(Not run)



