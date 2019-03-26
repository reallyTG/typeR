library(preText)


### Name: dfm_scaling_test
### Title: Comparison of dfms using N-dimensional scaling, with a test for
###   difference from the mean dfm scaled position.
### Aliases: dfm_scaling_test

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
##D # now perform the scaling test
##D dfm_scaling_test(scaling_results,
##D                  labels = preprocessed_documents$labels)
## End(Not run)



