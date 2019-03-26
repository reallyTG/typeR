library(MiRKAT)


### Name: MiRKAT
### Title: Microbiome Regression-based Kernel Association Test
### Aliases: MiRKAT

### ** Examples


#############################################################
# Generate data
set.seed(1)
n = 100
family= "binomial"
nperm = 999
X = rnorm(n)
Z = matrix((runif(n*5) > 0.5)^2, n, 5)
K = Z %*% t(Z)
K2 = (Z %*% t(Z)+ 1)^2
Ks = list(K, K2)
y = rnorm(n)

MiRKAT(y, X = X, Ks = Ks, out_type="C", method = "davies")

#################################
y = (runif(n) < 0.5)^2
MiRKAT(y, X = X, Ks = Ks, out_type="D")



