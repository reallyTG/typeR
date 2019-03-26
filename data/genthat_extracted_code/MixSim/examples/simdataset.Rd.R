library(MixSim)


### Name: simdataset
### Title: Dataset Simulation
### Aliases: simdataset
### Keywords: cluster datagen

### ** Examples

## Not run: 
##D set.seed(1234)
##D 
##D repeat{
##D    Q <- MixSim(BarOmega = 0.01, K = 4, p = 2)
##D    if (Q$fail == 0) break
##D }
##D 
##D # simulate a dataset of size 300 and add 10 outliers simulated on (0,1)x(0,1)
##D A <- simdataset(n = 500, Pi = Q$Pi, Mu = Q$Mu, S = Q$S, n.out = 10, int = c(0, 1))
##D colors <- c("red", "green", "blue", "brown", "magenta")
##D plot(A$X, xlab = "x1", ylab = "x2", type = "n")
##D for (k in 0:4){
##D    points(A$X[A$id == k, ], col = colors[k+1], pch = 19, cex = 0.5)
##D }
##D 
##D repeat{
##D    Q <- MixSim(MaxOmega = 0.1, K = 4, p = 1)
##D    if (Q$fail == 0) break
##D }
##D 
##D # simulate a dataset of size 300 with 1 noise variable
##D A <- simdataset(n = 300, Pi = Q$Pi, Mu = Q$Mu, S = Q$S, n.noise = 1)
##D plot(A$X, xlab = "x1", ylab = "x2", type = "n")
##D for (k in 1:4){
##D    points(A$X[A$id == k, ], col = colors[k+1], pch = 19, cex = 0.5)
##D }
## End(Not run)



