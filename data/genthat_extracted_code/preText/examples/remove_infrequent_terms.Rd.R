library(preText)


### Name: remove_infrequent_terms
### Title: Remove infrequently occurring terms from quanteda dfm.
### Aliases: remove_infrequent_terms

### ** Examples

## Not run: 
##D # load the package
##D library(preText)
##D # load in the data
##D data("UK_Manifestos")
##D # preprocess data
##D preprocessed_documents <- factorial_preprocessing(
##D     UK_Manifestos,
##D     use_ngrams = TRUE,
##D     infrequent_term_threshold = 0.02,
##D     verbose = TRUE)
##D updated_dfm <- remove_infrequent_terms(preprocessed_documents$dfm_list[[1]],
##D                                        proportion_threshold = 0.5,
##D                                        indices = NULL,
##D                                        verbose = TRUE)
## End(Not run)



