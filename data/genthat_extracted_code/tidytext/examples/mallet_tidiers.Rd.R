library(tidytext)


### Name: mallet_tidiers
### Title: Tidiers for Latent Dirichlet Allocation models from the mallet
###   package
### Aliases: mallet_tidiers tidy.jobjRef augment.jobjRef

### ** Examples


## Not run: 
##D library(mallet)
##D library(dplyr)
##D 
##D data("AssociatedPress", package = "topicmodels")
##D td <- tidy(AssociatedPress)
##D 
##D # mallet needs a file with stop words
##D tmp <- tempfile()
##D writeLines(stop_words$word, tmp)
##D 
##D # two vectors: one with document IDs, one with text
##D docs <- td %>%
##D   group_by(document = as.character(document)) %>%
##D   summarize(text = paste(rep(term, count), collapse = " "))
##D 
##D docs <- mallet.import(docs$document, docs$text, tmp)
##D 
##D # create and run a topic model
##D topic_model <- MalletLDA(num.topics = 4)
##D topic_model$loadDocuments(docs)
##D topic_model$train(20)
##D 
##D # tidy the word-topic combinations
##D td_beta <- tidy(topic_model)
##D td_beta
##D 
##D # Examine the four topics
##D td_beta %>%
##D   group_by(topic) %>%
##D   top_n(8, beta) %>%
##D   ungroup() %>%
##D   mutate(term = reorder(term, beta)) %>%
##D   ggplot(aes(term, beta)) +
##D   geom_col() +
##D   facet_wrap(~ topic, scales = "free") +
##D   coord_flip()
##D 
##D # find the assignments of each word in each document
##D assignments <- augment(topic_model, td)
##D assignments
## End(Not run)




