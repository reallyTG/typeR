library(NMF)


### Name: summary
### Title: Assessing and Comparing NMF Models
### Aliases: summary summary-methods summary-NMF summary,NMFfit-method
###   summary,NMFfitX-method summary,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# summary,NMF-method
#----------
# random NMF model
x <- rnmf(3, 20, 12)
summary(x)
summary(x, gl(3, 4))
summary(x, target=rmatrix(x))
summary(x, gl(3,4), target=rmatrix(x))

#----------
# summary,NMFfit-method
#----------
# generate a synthetic dataset with known classes: 50 features, 18 samples (5+5+8)
n <- 50; counts <- c(5, 5, 8);
V <- syntheticNMF(n, counts)
cl <- unlist(mapply(rep, 1:3, counts))

# perform default NMF with rank=2
x2 <- nmf(V, 2)
summary(x2, cl, V)
# perform default NMF with rank=2
x3 <- nmf(V, 3)
summary(x2, cl, V)



