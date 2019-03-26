library(OpenMx)


### Name: omxSapply
### Title: On-Demand Parallel Sapply
### Aliases: omxSapply

### ** Examples


x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
omxSapply(x, quantile)




