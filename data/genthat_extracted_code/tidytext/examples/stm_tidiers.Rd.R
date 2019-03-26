library(tidytext)


### Name: stm_tidiers
### Title: Tidiers for Structural Topic Models from the stm package
### Aliases: stm_tidiers tidy.STM tidy.estimateEffect augment.STM
###   glance.STM

### ** Examples


## Not run: 
##D if (requireNamespace("stm", quietly = TRUE)) {
##D   library(dplyr)
##D   library(ggplot2)
##D   library(stm)
##D   library(janeaustenr)
##D 
##D   austen_sparse <- austen_books() %>%
##D     unnest_tokens(word, text) %>%
##D     anti_join(stop_words) %>%
##D     count(book, word) %>%
##D     cast_sparse(book, word, n)
##D   topic_model <- stm(austen_sparse, K = 12, verbose = FALSE, init.type = "Spectral")
##D 
##D   # tidy the word-topic combinations
##D   td_beta <- tidy(topic_model)
##D   td_beta
##D 
##D   # Examine the topics
##D   td_beta %>%
##D     group_by(topic) %>%
##D     top_n(10, beta) %>%
##D     ungroup() %>%
##D     ggplot(aes(term, beta)) +
##D     geom_col() +
##D     facet_wrap(~ topic, scales = "free") +
##D     coord_flip()
##D 
##D   # tidy the document-topic combinations, with optional document names
##D   td_gamma <- tidy(topic_model, matrix = "gamma",
##D                    document_names = rownames(austen_sparse))
##D   td_gamma
##D 
##D   # using stm's gardarianFit, we can tidy the result of a model
##D   # estimated with covariates
##D   effects <- estimateEffect(1:3 ~ treatment, gadarianFit, gadarian)
##D   td_estimate <- tidy(effects)
##D   td_estimate
##D 
##D }
## End(Not run)




