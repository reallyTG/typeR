library(textmining)


### Name: topic_table
### Title: Function to calculate topics and words arrays from the mallet
###   model.
### Aliases: topic_table

### ** Examples

## Not run: 
##D library(rJava)
##D x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
##D                                               collapse = "")))
##D 
##D model <- train(x)
##D new_x <- tmCorpus(lapply(1:100, function(x) paste(sample(LETTERS, 11),
##D                                                   collapse = "")))
##D 
##D 
##D topic_table(model)
##D 
##D y <- DocumentTermMatrix(x)
##D rownames(y) <- meta(x, "title")
##D jss_TM <-
##D   list(VEM = train(y, k = k, control = list(seed = SEED)),
##D        VEM_fixed = train(y, k = k,
##D                          control = list(estimate.alpha = FALSE, seed = SEED)),
##D        Gibbs = train(y, k = k, method = "Gibbs",
##D                      control = list(seed = SEED, burnin = 1000,
##D                                     thin = 100, iter = 1000)))
##D pred_VEM <- predict(jss_TM$VEM, new_x)
## End(Not run)



