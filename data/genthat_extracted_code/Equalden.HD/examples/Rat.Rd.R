library(Equalden.HD)


### Name: Rat
### Title: Rat data
### Aliases: Rat
### Keywords: datasets

### ** Examples

## Don't show: 
data(Rat)
X <- Rat
k <- dim(X)[1]
s <- apply(X[1:100,], 1, density)
## End(Don't show)
## No test: 
data(Rat)
X <- Rat
k <- dim(X)[1]
### Estimated densities of logged gene expression levels.
s <- apply(X, 1, density)
### Plot of estimated densities of 6 randomly selected genes.
set.seed(375)
rs <- sample(1:k, 6)
plot(s[[rs[1]]], main = "Kernel estimates for 6 randomly selected genes",
 xlab = "x", ylab = "density", xlim = c(-4, 2), ylim = c(0, 6))
for (i in 2:6){
  lines(s[[rs[i]]], col = i)
}
## End(No test)



