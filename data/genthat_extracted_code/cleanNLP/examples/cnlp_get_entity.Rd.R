library(cleanNLP)


### Name: cnlp_get_entity
### Title: Access named entities from an annotation object
### Aliases: cnlp_get_entity

### ** Examples

require(dplyr)
data(obama)

# what are the most common entity types used in the addresses?
cnlp_get_entity(obama)$entity_type %>%
 table()

# what are the most common locations mentioned?
res <- cnlp_get_entity(obama) %>%
  filter(entity_type == "LOCATION")
res$entity %>%
  table() %>%
  sort(decreasing = TRUE) %>%
  head(n = 25)

# what are the most common organizations mentioned?
res <- cnlp_get_entity(obama) %>%
  filter(entity_type == "ORGANIZATION")
res$entity %>%
  table() %>%
  sort(decreasing = TRUE) %>%
  head(n = 25)




