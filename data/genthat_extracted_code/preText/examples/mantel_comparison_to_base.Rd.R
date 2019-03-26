library(preText)


### Name: mantel_comparison_to_base
### Title: Ensemble Mantel Tests
### Aliases: mantel_comparison_to_base

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
##D # scale documents
##D scaling_results <- scaling_comparison(preprocessed_documents$dfm_list,
##D                                       dimensions = 2,
##D                                       distance_method = "cosine",
##D                                       verbose = TRUE)
##D # run mantel comparison to base and plot
##D mantel_comparison_to_base(scaling_results$distance_matrices,
##D                           names = preprocessed_documents$labels,
##D                           permutations = 1000)
## End(Not run)



