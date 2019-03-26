library(MRS)


### Name: plot2D
### Title: Plot regions of the representative tree in 2D
### Aliases: plot2D

### ** Examples

set.seed(1)
p = 2
n1 = 200
n2 = 200
mu1 = matrix( c(9,9,0,4,-2,-10,3,6,6,-10), nrow = 5, byrow=TRUE)
mu2 = mu1; mu2[2,] = mu1[2,] + 1

Z1 = sample(5, n1, replace=TRUE)
Z2 = sample(5, n2, replace=TRUE)
X1 = mu1[Z1,] + matrix(rnorm(n1*p), ncol=p)
X2 = mu2[Z2,] + matrix(rnorm(n2*p), ncol=p)
X = rbind(X1, X2)
colnames(X) = c(1,2)
G = c(rep(1, n1), rep(2,n2))

ans = mrs(X, G, K=8)
plot2D(ans, type = "prob", legend = TRUE)

plot2D(ans, type="empty", data.points = "differential",
 background = "none")

plot2D(ans, type="none", data.points = "differential",
 background = "smeared", levels = 4)



