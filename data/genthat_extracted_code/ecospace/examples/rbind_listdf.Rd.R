library(ecospace)


### Name: rbind_listdf
### Title: Combine Large Lists of Data Frames.
### Aliases: rbind_listdf

### ** Examples

nl <- 1000     # List length
lists <- vector("list", length=nl)
for(i in 1:nl) lists[[i]] <- list(x = rnorm(100), y = rnorm(100))
str(lists)
object.size(lists)     # ~ 2.0 MB
all <- rbind_listdf(lists)
str(all)
object.size(all)       # ~ 1.6 MB

# Build blank ecospace framework to use in simulations
ecospace <- create_ecospace(nchar=15, char.state=rep(3, 15), char.type=rep("numeric", 15))

# Build 10 samples for neutral model:
nreps <- 1:10
Smax <- 10
n.samples <- lapply(X=nreps, FUN=neutral, Sseed=3, Smax=Smax, ecospace)

# Calculate functional diversity metrics for simulated samples
n.metrics <- lapply(X=nreps, FUN=calc_metrics, samples=n.samples, Model="neutral", Param="NA")
alarm()
str(n.metrics)

# rbind lists together into a single dataframe
all <- rbind_listdf(n.metrics)

# Calculate mean dynamics
means <- n.metrics[[1]]
for(n in 1:Smax) means[n,4:11] <- apply(all[which(all$S==means$S[n]),4:11], 2, mean, na.rm=TRUE)
means

# Plot statistics as function of species richness, overlaying mean dynamics
op <- par()
par(mfrow=c(2,4), mar=c(4, 4, 1, .3))
attach(all)

plot(S, H, type="p", cex=.75, col="gray")
lines(means$S, means$H, type="l", lwd=2)
plot(S, D, type="p", cex=.75, col="gray")
lines(means$S, means$D, type="l", lwd=2)
plot(S, M, type="p", cex=.75, col="gray")
lines(means$S, means$M, type="l", lwd=2)
plot(S, V, type="p", cex=.75, col="gray")
lines(means$S, means$V, type="l", lwd=2)
plot(S, FRic, type="p", cex=.75, col="gray")
lines(means$S, means$FRic, type="l", lwd=2)
plot(S, FEve, type="p", cex=.75, col="gray")
lines(means$S, means$FEve, type="l", lwd=2)
plot(S, FDiv, type="p", cex=.75, col="gray")
lines(means$S, means$FDiv, type="l", lwd=2)
plot(S, FDis, type="p", cex=.75, col="gray")
lines(means$S, means$FDis, type="l", lwd=2)

par(op)

## Not run: 
##D # Note each of following can take a few seconds to run
##D # Compare timings:
##D t0 <- Sys.time()
##D all <- rbind_listdf(lists)
##D (Sys.time() - t0)
##D 
##D t0 <- Sys.time()
##D all <- rbind_listdf(lists, seq.by=20)
##D (Sys.time() - t0)
##D 
##D t0 <- Sys.time()
##D all <- rbind_listdf(lists, seq.by=500)
##D (Sys.time() - t0)
##D 
##D # Compare to non-function version
##D all2 <- data.frame()
##D t0 <- Sys.time()
##D for(i in 1:nl) all2 <- rbind(all2, lists[[i]])
##D (Sys.time() - t0)
## End(Not run)




