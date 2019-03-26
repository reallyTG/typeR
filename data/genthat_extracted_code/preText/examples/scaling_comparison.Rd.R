library(preText)


### Name: scaling_comparison
### Title: Scaling Comparison.
### Aliases: scaling_comparison

### ** Examples

## Not run: 
##D # *** This function is used automatically inside of the preText() function.
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
##D # scale documents
##D scaling_results <- scaling_comparison(preprocessed_documents$dfm_list,
##D                                       dimensions = 2,
##D                                       distance_method = "cosine",
##D                                       verbose = TRUE)
## End(Not run)



