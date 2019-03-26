library(treethresh)


### Name: treethresh
### Title: Compute optimal thresholding partition for a sequence, matrix,
###   or array of data.
### Aliases: treethresh
### Keywords: tree nonparametric

### ** Examples

# (1) Create a vector with the probabilities of a signal being present
w.true <- c(rep(0.1,400),rep(0.7,300),rep(0.1,300))

# (2) Generate the signal
mu <- numeric(length(w.true))
non.zero.entry <- runif(length(mu))<w.true
num.non.zero.entries <- sum(non.zero.entry)
mu[non.zero.entry] <- rexp(num.non.zero.entries,rate=0.5)*
                         sample(c(-1,1),num.non.zero.entries,replace=TRUE)

# (3) Split graphics device
par(mfrow=c(2,2))

# (3) Draw the true signal (signal present in red)
plot(mu,col=non.zero.entry+1)
title("True signal")

# (4) Add noise to the signal
x <- mu + rnorm(length(mu))

# (5) Plot the noisy signal (signal present in red)
plot(x,col=non.zero.entry+1)
title("Noisy signal")

# (6) Carry out the tree-based thresholding
tt <- treethresh(x)

# (7) Prune the tree
tt.pruned <- prune(tt)

# (8) Threshold the signal according to the pruned tree
mu.hat <- thresh(tt.pruned)

# (9) Print the denoised signal
plot(mu.hat,col=non.zero.entry+1)
title("Denoised signal")

# (10) Add solid lines for splits (lines removed by the pruing are dashed)
abline(v=tt$split[,"pos"],lty=2)
abline(v=tt.pruned$split[,"pos"],lty=1)



