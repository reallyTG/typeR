library(cleanNLP)


### Name: cnlp_get_dependency
### Title: Access dependencies from an annotation object
### Aliases: cnlp_get_dependency

### ** Examples

data(obama)

# find the most common noun lemmas that are the syntactic subject of a
# clause
require(dplyr)
res <- cnlp_get_dependency(obama, get_token = TRUE) %>%
  filter(relation == "nsubj")
res$lemma_target %>%
  table() %>%
  sort(decreasing = TRUE) %>%
  head(n = 40)




