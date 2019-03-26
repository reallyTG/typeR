library(textmineR)


### Name: CalcGamma
### Title: Calculate a matrix whose rows represent P(topic_i|tokens)
### Aliases: CalcGamma

### ** Examples

# Load a pre-formatted dtm and topic model
data(nih_sample_topic_model) 

# Make a gamma matrix, P(topic|words)
gamma <- CalcGamma(phi = nih_sample_topic_model$phi, 
                   theta = nih_sample_topic_model$theta)




