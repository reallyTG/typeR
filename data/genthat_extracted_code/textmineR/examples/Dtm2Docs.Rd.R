library(textmineR)


### Name: Dtm2Docs
### Title: Convert a DTM to a Character Vector of documents
### Aliases: Dtm2Docs

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample)
data(nih_sample_dtm) 

# see the original documents
nih_sample$ABSTRACT_TEXT[ 1:3 ]

# see the new documents re-structured from the DTM
new_docs <- Dtm2Docs(dtm = nih_sample_dtm)

new_docs[ 1:3 ]




