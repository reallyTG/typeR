library(udpipe)


### Name: unique_identifier
### Title: Create a unique identifier for each combination of fields in a
###   data frame
### Aliases: unique_identifier

### ** Examples

data(brussels_reviews_anno)
x <- brussels_reviews_anno
x$doc_sent_id <- unique_identifier(x, fields = c("doc_id", "sentence_id"))
head(x, 15)
range(x$doc_sent_id)
x$doc_sent_id <- unique_identifier(x, fields = c("doc_id", "sentence_id"), start_from = 10)
head(x, 15)
range(x$doc_sent_id)



