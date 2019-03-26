library(preText)


### Name: topic_key_term_plot
### Title: Plot Prevalence of Topic Key Terms
### Aliases: topic_key_term_plot

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
##D # run a topic model with the optimal number of topics for each preproc. spec.
##D top_terms_list <- vector(mode = "list", length = 128)
##D for (i in 1:128) {
##D      fit <- topicmodels::LDA(quanteda::convert(preprocessed_documents$dfm_list[[i]],
##D                                                to = "topicmodels"),
##D                              k = optimal_k[i])
##D      # extract out top 20 terms for each topic
##D      top_terms <- terms(fit,20)
##D      top_terms_list[[i]] <- top_terms
##D }
##D # !!!!!! You will need to look for some key terms, and store them in a
##D # data.frame. Your code should be based off of the following. !!!!
##D # function to search for a term
##D find_term <- function(vec, term) {
##D      tc <- 0
##D      for(i in 1:length(term)) {
##D          tc <- tc + sum(grepl(term[i],vec, ignore.case = T))
##D      }
##D      if (tc > 0) {
##D          return(TRUE)
##D      } else {
##D          return(FALSE)
##D      }
##D }
##D 
##D # look for topics containing the terms below -- this is from our example with
##D # press releases so it will have to be modified.
##D # allows for multiple top terms related to the same concept
##D num_topics <- rep(0, length = 128)
##D search_list <- list(iraq = c("iraq"),
##D                     terror = c("terror"),
##D                     al_qaeda = c("qaeda"),
##D                     insurance = c("insur"),
##D                     stem_cell = c("stem"))
##D 
##D # where we will store our results
##D topics_in_results <- data.frame(
##D     preprocessing_steps = preprocessed_documents$labels,
##D     iraq = num_topics,
##D     terror = num_topics,
##D     al_qaeda = num_topics,
##D     insurance = num_topics,
##D     stem_cell = num_topics,
##D     optimal_number_of_topics = optimal_k,
##D     stringsAsFactors = FALSE)
##D # count the number of topics in which each top term appears
##D for (i in 1:128) {
##D     # allows for multiple top terms related to the same concept
##D     top_terms <- top_terms_list[[i]]
##D     for (j in 1:length(search_list)) {
##D         in_topic <- apply(top_terms,2,find_term, term = search_list[[j]])
##D         which_topics <- which(in_topic)
##D         topics_in_results[i,(j+1)] <- length(which_topics)
##D     }
##D }
##D # now make a plot:
##D topic_key_term_plot(
##D      topics_in_results,
##D      preprocessed_documents$labels,
##D      key_term_columns  = 2:6,
##D      custom_col_names = c("Iraq", "Terrorism", "Al Qaeda", "Insurance", "Stem Cell"),
##D      custom_labels = c("0%","<1%","1-2%","2-3%","3-4%","4-5%","5-6%","6-7%","7-8%",
##D                        "8-9%","9-10%","10%+"),
##D      one_matrix = FALSE,
##D      thresholds = c(-0.0001,0,0.0099,0.0199,0.0299,0.0399,0.0499,0.0599,0.0699,
##D                     0.0799,0.0899,0.0999),
##D      heat_ramp = FALSE,
##D      return_data = FALSE)
## End(Not run)



