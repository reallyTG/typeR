library(spMC)


### Name: is.pemt
### Title: Images with Multi-direct'ional Transiograms
### Aliases: is.pemt
### Keywords: spatial attribute

### ** Examples
## No test: 
data(ACM)

# Compute a 2-D section of a
# multi-directional transiogram
psEmpTr <- pemt(ACM$MAT3, ACM[, 1:3], 2,
                max.dist = c(20, 10, 5), 
                which.dire=c(1, 3), 
                mle = TRUE)

# Test the object psEmpTr
is.pemt(psEmpTr)
## End(No test)


