library(sentimentr)


### Name: available_data
### Title: Get Available Data
### Aliases: available_data sentimentr_data

### ** Examples

sentimentr_data()
available_data() ## generic version for export
available_data(package = 'datasets')
sentimentr_data('^hu')
sentimentr_data('^(hu|kot)')
combine_data(sentimentr_data('^(hu|kot)')[[1]])

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(sentimentr, tidyverse, magrittr)
##D 
##D sentiment_data <- sentimentr_data('^hu') %>%
##D     pull(Data) %>%
##D     combine_data() %>%
##D     mutate(id = seq_len(n())) %>%
##D     as_tibble()
##D     
##D sentiment_test <- sentiment_data %>%
##D     select(-sentiment) %>%
##D     get_sentences() %$%
##D     sentiment(., by = c('id'))
##D 
##D testing <- sentiment_data %>%
##D     left_join(sentiment_test, by = 'id') %>%
##D     as_tibble() %>%
##D     mutate(
##D         actual = sign(sentiment),
##D         predicted = sign(ave_sentiment)
##D     )
##D 
##D testing %$%
##D     ftable(predicted, actual)
## End(Not run)



