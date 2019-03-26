library(cleanNLP)


### Name: cnlp_get_token
### Title: Access tokens from an annotation object
### Aliases: cnlp_get_token

### ** Examples

data(obama)

# find average sentence length from each address
require(dplyr)
cnlp_get_token(obama) %>%
  group_by(id, sid) %>%
  summarize(sentence_length = max(tid)) %>%
  summarize(avg_sentence_length = mean(sentence_length))



