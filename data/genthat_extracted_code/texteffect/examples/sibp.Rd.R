library(texteffect)


### Name: sibp
### Title: Supervised Indian Buffet Process (sibp) for Discovering
###   Treatments
### Aliases: sibp

### ** Examples

##Load the Wikipedia biography data
data(BioSample)

# Divide into training and test sets
Y <- BioSample[,1]
X <- BioSample[,-1]
set.seed(1)
train.ind <- sample(1:nrow(X), size = 0.5*nrow(X), replace = FALSE)

# Search sIBP for several parameter configurations; fit each to the training set
sibp.search <- sibp_param_search(X, Y, K = 2, alphas = c(2,4), sigmasq.ns = c(0.8, 1), 
								 iters = 1, train.ind = train.ind)
								 
## Not run: 
##D # Get metric for evaluating most promising parameter configurations
##D sibp_rank_runs(sibp.search, X, 10)
##D 
##D # Qualitatively look at the top candidates
##D sibp_top_words(sibp.search[["4"]][["0.8"]][[1]], colnames(X), 10, verbose = TRUE)
##D sibp_top_words(sibp.search[["4"]][["1"]][[1]], colnames(X), 10, verbose = TRUE)
##D 
##D # Select the most interest treatments to investigate
##D sibp.fit <- sibp.search[["4"]][["0.8"]][[1]]
##D 
##D # Estimate the AMCE using the test set
##D amce<-sibp_amce(sibp.fit, X, Y)
##D # Plot 95% confidence intervals for the AMCE of each treatment
##D sibp_amce_plot(amce)
## End(Not run)



