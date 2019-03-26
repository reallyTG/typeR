library(kSamples)


### Name: qn.test.combined
### Title: Combined Rank Score k-Sample Tests
### Aliases: qn.test.combined
### Keywords: nonparametric htest design

### ** Examples

## Create two lists of sample vectors.
x1 <- list( c(1, 3, 2, 5, 7), c(2, 8, 1, 6, 9, 4), c(12, 5, 7, 9, 11) )
x2 <- list( c(51, 43, 31, 53, 21, 75), c(23, 45, 61, 17, 60) )
# and a corresponding data frame datx1x2
x1x2 <- c(unlist(x1),unlist(x2))
gx1x2 <- as.factor(c(rep(1,5),rep(2,6),rep(3,5),rep(1,6),rep(2,5)))
bx1x2 <- as.factor(c(rep(1,16),rep(2,11)))
datx1x2 <- data.frame(A = x1x2, G = gx1x2, B = bx1x2)

## Run qn.test.combined.
set.seed(2627)
qn.test.combined(x1, x2, method = "simulated", Nsim = 1000) 
# or with same seed
# qn.test.combined(list(x1, x2), method = "simulated", Nsim = 1000)
# or qn.test.combined(A~G|B,data=datx1x2,method="simulated",Nsim=1000)



