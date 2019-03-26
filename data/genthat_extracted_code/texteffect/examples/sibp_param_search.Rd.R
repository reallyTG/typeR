library(texteffect)


### Name: sibp_param_search
### Title: Search Parameter Configurations for Supervised Indian Buffet
###   Process (sibp)
### Aliases: sibp_param_search

### ** Examples

##Load the sample of Wikipedia biography data
data(BioSample)

# Divide into training and test sets
Y <- BioSample[,1]
X <- BioSample[,-1]
set.seed(1)
train.ind <- sample(1:nrow(X), size = 0.5*nrow(X), replace = FALSE)

# Search sIBP for several parameter configurations; fit each to the training set
sibp.search <- sibp_param_search(X, Y, K = 2, alphas = c(2,4),
                                 sigmasq.ns = c(0.8, 1), iters = 1,
							     train.ind = train.ind)
								 
## Not run: 
##D # Get metric for evaluating most promising parameter configurations
##D sibp_rank_runs(sibp.search, X, 10)
##D 
##D # Qualitatively look at the top candidates
##D sibp_top_words(sibp.search[["4"]][["0.8"]][[1]], colnames(X), 10, verbose = TRUE)
##D sibp_top_words(sibp.search[["4"]][["1"]][[1]], colnames(X), 10, verbose = TRUE)
## End(Not run)



