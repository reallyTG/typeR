library(textmineR)


### Name: CalcProbCoherence
### Title: Probabilistic coherence of topics
### Aliases: CalcProbCoherence

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_topic_model)
data(nih_sample_dtm) 

CalcProbCoherence(phi = nih_sample_topic_model$phi, dtm = nih_sample_dtm, M = 5)



