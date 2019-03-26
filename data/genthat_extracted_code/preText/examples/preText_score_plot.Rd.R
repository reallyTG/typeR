library(preText)


### Name: preText_score_plot
### Title: preText specification plot
### Aliases: preText_score_plot

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
##D # run preText
##D preText_results <- preText(
##D     preprocessed_documents,
##D     dataset_name = "Inaugural Speeches",
##D     distance_method = "cosine",
##D     num_comparisons = 100,
##D     verbose = TRUE)
##D # generate preText score plot
##D preText_score_plot(preText_results)
## End(Not run)



