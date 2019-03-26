library(MRS)


### Name: andova
### Title: Multi Resolution Scanning for one-way ANDOVA using the
###   multi-scale Beta-Binomial model
### Aliases: andova

### ** Examples

set.seed(1)
n = 1000
M = 5
class_1 = sample(M, n, prob= 1:5, replace=TRUE  )
class_2 = sample(M, n, prob = 5:1, replace=TRUE )

Y_1 = rnorm(n, mean=class_1, sd = .2)
Y_2 = rnorm(n, mean=class_2, sd = .2)

X = matrix( c(Y_1, Y_2), ncol = 1)
G = c(rep(1,n),rep(2,n))
H = sample(3,2*n, replace = TRUE  )

ans = andova(X, G, H)
ans$PostGlobNull
plot1D(ans)



