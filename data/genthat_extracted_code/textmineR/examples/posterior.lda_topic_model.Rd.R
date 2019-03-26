library(textmineR)


### Name: posterior.lda_topic_model
### Title: Draw from the posterior of an LDA topic model
### Aliases: posterior.lda_topic_model

### ** Examples

## Not run: 
##D a <- posterior(object = nih_sample_topic_model, which = "theta", num_samples = 20)
##D 
##D plot(density(a$t1[a$var == "8693991"]))
##D 
##D b <- posterior(object = nih_sample_topic_model, which = "phi", num_samples = 20)
##D 
##D plot(denisty(b$research[b$var == "t_5"]))
## End(Not run)



