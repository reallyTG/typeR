library(sparklyr)


### Name: ml_lda
### Title: Spark ML - Latent Dirichlet Allocation
### Aliases: ml_lda ml_describe_topics ml_log_likelihood ml_log_perplexity
###   ml_topics_matrix

### ** Examples

## Not run: 
##D library(janeaustenr)
##D library(dplyr)
##D sc <-  spark_connect(master = "local")
##D 
##D lines_tbl <- sdf_copy_to(sc,
##D                          austen_books()[c(1:30),],
##D                          name = "lines_tbl",
##D                          overwrite = TRUE)
##D 
##D # transform the data in a tidy form
##D lines_tbl_tidy <- lines_tbl %>%
##D   ft_tokenizer(input_col = "text",
##D                output_col = "word_list") %>%
##D   ft_stop_words_remover(input_col = "word_list",
##D                         output_col = "wo_stop_words") %>%
##D   mutate(text = explode(wo_stop_words)) %>%
##D   filter(text != "") %>%
##D   select(text, book)
##D 
##D lda_model <- lines_tbl_tidy %>%
##D   ml_lda(~text, k = 4)
##D 
##D # vocabulary and topics
##D tidy(lda_model)
## End(Not run)




