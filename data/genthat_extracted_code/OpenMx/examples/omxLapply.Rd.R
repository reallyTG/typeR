library(OpenMx)


### Name: omxLapply
### Title: On-Demand Parallel Lapply
### Aliases: omxLapply

### ** Examples


x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
omxLapply(x,mean)




