library(preText)


### Name: optimal_k_comparison
### Title: Optimal Topic Model k Comparison
### Aliases: optimal_k_comparison

### ** Examples

## Not run: 
##D set.seed(12345)
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
##D cross_validation_splits <- 10
##D # create 10 test/train splits
##D train_inds <- vector(mode = "list", length = cross_validation_splits)
##D test_inds <- vector(mode = "list", length = cross_validation_splits)
##D # sample CV indices
##D for (i in 1:cross_validation_splits) {
##D     test <- sample(1:length(UK_Manifestos),
##D                    size = round(length(UK_Manifestos)/5),
##D                    replace = FALSE)
##D     train <- 1:length(UK_Manifestos)
##D     for (j in 1:length(test)) {
##D         train <- train[-which(train == test[j])]
##D     }
##D     train_inds[[i]] <- train
##D     test_inds[[i]] <- test
##D }
##D # get the optimal number of topics (this will take a very long time):
##D optimal_k <- optimal_k_comparison(
##D      train_inds,
##D      test_inds,
##D      preprocessed_documents$dfm_list,
##D      topics = c(25,50,75,100,125,150,175,200),
##D      names  = preprocessed_documents$labels)
## End(Not run)



