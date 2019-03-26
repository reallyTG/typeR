library(textmineR)


### Name: TermDocFreq
### Title: Get term frequencies and document frequencies from a document
###   term matrix.
### Aliases: TermDocFreq

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_dtm)
data(nih_sample_topic_model) 

# Get the term frequencies 
term_freq_mat <- TermDocFreq(nih_sample_dtm)

str(term_freq_mat)



