library(preText)


### Name: wordfish_comparison
### Title: Wordfish Comparison.
### Aliases: wordfish_comparison

### ** Examples

## Not run: 
##D # replicates wordfish aanalysis from Denny and Spirling (2016)
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
##D # get the years each document was written and store them as a numeric vector
##D dfm <- preprocessed_documents$dfm_list[[1]]
##D rl <- function(str) {
##D     stringr::str_replace_all(str,"[A-Za-z]+","")
##D }
##D years <- as.numeric(sapply(rownames(dfm),rl))
##D 
##D # use the wordfish_comparison function to compare all dfms. We are using
##D # conservative and labour manifestos from 1983, 1987, 1992, and 1997 for a total
##D # of 8 manifestos. These are indicated by the document_inidices = c(19:22,42:45)
##D # argument. You can see the document names by entering rownames(dfm) into the
##D # console. We need to set the anchors to 5,1 because anchoring is applied in the
##D # reduced dfm. We are also only including terms that appear atleast once in a
##D # manifesto from each of the 4 years, to deal with the strong temporal effects.
##D wordfish_results <- wordfish_comparison(
##D     preprocessed_documents$dfm_list,
##D     years,
##D     anchors = c(1,5),
##D     proportion_threshold = 1,
##D     document_inidices = c(19:22,42:45))
## End(Not run)



