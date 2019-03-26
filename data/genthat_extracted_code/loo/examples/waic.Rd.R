library(loo)


### Name: waic
### Title: Widely applicable information criterion (WAIC)
### Aliases: waic waic.array waic.matrix waic.function

### ** Examples

### Array and matrix methods
LLarr <- example_loglik_array()
dim(LLarr)

LLmat <- example_loglik_matrix()
dim(LLmat)

waic_arr <- waic(LLarr)
waic_mat <- waic(LLmat)
identical(waic_arr, waic_mat)


## Not run: 
##D log_lik1 <- extract_log_lik(stanfit1)
##D log_lik2 <- extract_log_lik(stanfit2)
##D (waic1 <- waic(log_lik1))
##D (waic2 <- waic(log_lik2))
##D print(compare(waic1, waic2), digits = 2)
## End(Not run)




