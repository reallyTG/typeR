library(OpenMx)


### Name: omxApply
### Title: On-Demand Parallel Apply
### Aliases: omxApply

### ** Examples


x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
omxApply(x, 2, mean, trim = .2)




