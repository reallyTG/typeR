library(preText)


### Name: preText
### Title: preText: Diagnostics to Assess The Effects of Text Preprocessing
###   Decisions
### Aliases: preText preText-package preText

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
## End(Not run)



