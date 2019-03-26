library(textmineR)


### Name: CalcLikelihood
### Title: Calculate the log likelihood of a document term matrix given a
###   topic model
### Aliases: CalcLikelihood

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_dtm) 
data(nih_sample_topic_model)

# Get the likelihood of the data given the fitted model parameters
ll <- CalcLikelihood(dtm = nih_sample_dtm, 
                     phi = nih_sample_topic_model$phi, 
                     theta = nih_sample_topic_model$theta)

ll



