library(preText)


### Name: preText_test
### Title: preText Test
### Aliases: preText_test

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
##D # run preText test
##D preText_test_results <-preText_test(scaling_results$distance_matrices,
##D                                     choices = preprocessed_documents$choices,
##D                                     labels = preprocessed_documents$labels,
##D                                     baseline_index = 128,
##D                                     text_size = 1,
##D                                     num_comparisons = 50,
##D                                     parallel = FALSE,
##D                                     cores = 1,
##D                                     verbose = TRUE)
## End(Not run)



