library(textmineR)


### Name: CalcTopicModelR2
### Title: Calculate the R-squared of a topic model.
### Aliases: CalcTopicModelR2

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_dtm) 
data(nih_sample_topic_model)

# Get the R-squared of the model
r2 <- CalcTopicModelR2(dtm = nih_sample_dtm, 
                     phi = nih_sample_topic_model$phi, 
                     theta = nih_sample_topic_model$theta)


r2



