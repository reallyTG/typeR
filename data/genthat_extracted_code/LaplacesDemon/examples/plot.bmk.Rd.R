library(LaplacesDemon)


### Name: plot.bmk
### Title: Plot Hellinger Distances
### Aliases: plot.bmk
### Keywords: Plot

### ** Examples

library(LaplacesDemon)
N <- 1000 #Number of posterior samples
J <- 10 #Number of parameters
Theta <- matrix(runif(N*J),N,J)
colnames(Theta) <- paste("beta[", 1:J, "]", sep="")
for (i in 2:N) {Theta[i,1] <- Theta[i-1,1] + rnorm(1)}
HD <- BMK.Diagnostic(Theta, batches=10)
plot(HD, title="Hellinger distance between batches")



