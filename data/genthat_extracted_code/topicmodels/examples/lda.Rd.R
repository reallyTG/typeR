library(topicmodels)


### Name: LDA
### Title: Latent Dirichlet Allocation
### Aliases: LDA
### Keywords: models

### ** Examples

data("AssociatedPress", package = "topicmodels")
lda <- LDA(AssociatedPress[1:20,], control = list(alpha = 0.1), k = 2)
lda_inf <- posterior(lda, AssociatedPress[21:30,])



