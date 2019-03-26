library(textrank)


### Name: textrank_candidates_all
### Title: Get all combinations of sentences
### Aliases: textrank_candidates_all

### ** Examples

library(udpipe)
data(joboffer)
joboffer$textrank_id <- unique_identifier(joboffer, c("doc_id", "paragraph_id", "sentence_id"))
candidates <- textrank_candidates_all(unique(joboffer$textrank_id))
head(candidates, 50)



