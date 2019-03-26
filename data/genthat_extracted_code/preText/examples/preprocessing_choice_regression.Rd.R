library(preText)


### Name: preprocessing_choice_regression
### Title: Preprocessing Choice Regressions
### Aliases: preprocessing_choice_regression

### ** Examples

## Not run: 
##D # *** note that this function is already called in the preText() function and
##D # its output is returned in the results.
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
##D # get regression results
##D reg_results <- preprocessing_choice_regression(
##D      preText_results$preText_scores$preText_score,
##D      preprocessed_documents$choices,
##D      dataset = "UK Manifestos",
##D      base_case_index = 128)
## End(Not run)



