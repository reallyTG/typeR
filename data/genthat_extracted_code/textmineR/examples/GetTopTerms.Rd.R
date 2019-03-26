library(textmineR)


### Name: GetTopTerms
### Title: Get Top Terms for each topic from a topic model
### Aliases: GetTopTerms

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_topic_model) 

top_terms <- GetTopTerms(phi = nih_sample_topic_model$phi, M = 5)

str(top_terms)



