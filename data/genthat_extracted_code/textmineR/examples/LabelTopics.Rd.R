library(textmineR)


### Name: LabelTopics
### Title: Get some topic labels using a "more probable" method of terms
### Aliases: LabelTopics

### ** Examples

# make a dtm with unigrams and bigrams
data(nih_sample_topic_model)

m <- nih_sample_topic_model

assignments <- t(apply(m$theta, 1, function(x){
  x[ x < 0.05 ] <- 0
  x / sum(x)
}))

assignments[is.na(assignments)] <- 0

labels <- LabelTopics(assignments = assignments, dtm = m$data, M = 2)




