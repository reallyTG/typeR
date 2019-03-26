library(GeneNet)


### Name: cor0.test
### Title: Test of Vanishing (Partial) Correlation
### Aliases: cor0.test
### Keywords: htest

### ** Examples

# load GeneNet library
library("GeneNet")

# covariance matrix
m.cov <- rbind(
 c(3,1,1,0),
 c(1,3,0,1),
 c(1,0,2,0),
 c(0,1,0,2)
)

# compute partial correlations
m.pcor <- cor2pcor(m.cov)
m.pcor

# corresponding p-values 
# assuming a sample size of 25, i.e. kappa=22
kappa2n(22, 4)
cor0.test(m.pcor, kappa=22)
cor0.test(m.pcor, kappa=22) < 0.05

# p-values become smaller with larger r 
cor0.test(0.7, 12)
cor0.test(0.8, 12)
cor0.test(0.9, 12)

# comparison of various methods
cor0.test(0.2, 45, method="student")
cor0.test(0.2, 45, method="dcor0")
cor0.test(0.2, 45, method="ztransform")



