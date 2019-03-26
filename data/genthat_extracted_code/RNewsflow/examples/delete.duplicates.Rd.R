library(RNewsflow)


### Name: delete.duplicates
### Title: Delete duplicate (or similar) documents from a document term
###   matrix
### Aliases: delete.duplicates

### ** Examples

data(dtm)
data(meta)

## example with very low similarity threshold (normally not recommended!)
dtm2 = delete.duplicates(dtm, meta, similarity = 0.5, keep='first', tf.idf = TRUE)



