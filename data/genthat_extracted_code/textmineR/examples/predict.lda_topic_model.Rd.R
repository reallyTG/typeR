library(textmineR)


### Name: predict.lda_topic_model
### Title: Get predictions from a Latent Dirichlet Allocation model
### Aliases: predict.lda_topic_model

### ** Examples

## Not run: 
##D # load some data
##D data(nih_sample_dtm)
##D 
##D # fit a model 
##D set.seed(12345)
##D 
##D m <- FitLdaModel(dtm = nih_sample_dtm[1:20,], k = 5,
##D                  iterations = 200, burnin = 175)
##D 
##D str(m)
##D 
##D # predict on held-out documents using gibbs sampling "fold in"
##D p1 <- predict(m, nih_sample_dtm[21:100,], method = "gibbs",
##D               iterations = 200, burnin = 175)
##D 
##D # predict on held-out documents using the dot product method
##D p2 <- predict(m, nih_sample_dtm[21:100,], method = "dot")
##D 
##D # compare the methods
##D barplot(rbind(p1[1,],p2[1,]), beside = TRUE, col = c("red", "blue")) 
## End(Not run)



