library(preText)


### Name: factorial_preprocessing
### Title: A function to perform factorial preprocessing of a corpus of
###   texts into quanteda document-frequency matrices.
### Aliases: factorial_preprocessing

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
## End(Not run)



