## ------------------------------------------------------------------------
library(ecospace)
nchar <- 9
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep(c("factor", "ord.fac", "ord.num"), nchar / 3))

## ------------------------------------------------------------------------
Smax <- 50
set.seed(314)
neutral_sample <- neutral(Sseed=5, Smax=Smax, ecospace=ecospace)
head(neutral_sample, 10)

## ------------------------------------------------------------------------
set.seed(314)
Sseed=5
redund_sample <- redundancy(Sseed=Sseed, Smax=Smax, ecospace=ecospace)

## ------------------------------------------------------------------------
unique(redund_sample)

## ------------------------------------------------------------------------
set.seed(314)
redund_sample2 <- redundancy(Sseed=Sseed, Smax=Smax, ecospace=ecospace, strength=0.95)

## ---- fig.width = 5, fig.height=5----------------------------------------
library(FD, quietly=TRUE)
pc <- prcomp(FD::gowdis(redund_sample))
plot(pc$x, type="n", main=paste("Redundancy model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

pc.r <- prcomp(FD::gowdis(redund_sample2))
plot(pc.r$x, type="n", main=paste("Redundancy model (95% identical),\n", Smax, "species"))
text(pc.r$x[,1], pc.r$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

## ------------------------------------------------------------------------
set.seed(314)
Sseed=5
partS_sample <- partitioning(Sseed=Sseed, Smax=Smax, ecospace=ecospace)

## ------------------------------------------------------------------------
set.seed(314)
Sseed=5
partR_sample <- partitioning(Sseed=Sseed, Smax=Smax, ecospace=ecospace, rule="relaxed")

## ---- fig.width = 5, fig.height=5----------------------------------------
pc.ps <- prcomp(FD::gowdis(partS_sample))
plot(pc.ps$x, type="n", main=paste("'Strict' partitioning model,\n", Smax, "species"))
text(pc.ps$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

pc.pr <- prcomp(FD::gowdis(partR_sample))
plot(pc.pr$x, type="n", main=paste("'Relaxed' partitioning model,\n", Smax, "species"))
text(pc.pr$x[,1], pc.pr$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

## ------------------------------------------------------------------------
set.seed(314)
Sseed=5
exp_sample <- expansion(Sseed=Sseed, Smax=Smax, ecospace=ecospace)

## ---- fig.width = 5, fig.height=5----------------------------------------
pc.e <- prcomp(FD::gowdis(exp_sample))
plot(pc.e$x, type="n", main=paste("Expansion model,\n", Smax, "species"))
text(pc.e$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

## ---- fig.width = 5, fig.height=5----------------------------------------
library(vegan, quietly=TRUE)
start <- neutral_sample[1:Sseed,]
neu <- neutral_sample[(Sseed + 1):Smax,]
red <- redund_sample2[(Sseed + 1):Smax,]
par <- partR_sample[(Sseed + 1):Smax,]
exp <- exp_sample[(Sseed + 1):Smax,]
nmds.data <- rbind(start, neu, red, par, exp)
all <- metaMDS(gowdis(nmds.data), zerodist="add", k=2, trymax=10)

plot(all$points[,1], all$points[,2], col=c(rep("red", Sseed), rep("orange", nrow(neu)), rep("red", nrow(red)), rep("blue", nrow(par)), rep("purple", nrow(exp))), pch=c(rep(19, Sseed), rep(21, nrow(neu)), rep(22, nrow(red)), rep(23, nrow(par)), rep(24, nrow(exp))), main=paste("Combined models,\n", Smax, "species per model"), xlab="Axis 1", ylab="Axis 2", cex=2, cex.lab=1.5, lwd=1)

leg.txt <- c("seed", "neutral", "redundancy", "partitioning", "expansion")
leg.col <- c("red", "orange", "red", "blue", "purple")
leg.pch <- c(19, 21, 22, 23, 24)
legend("topright", inset=.02, legend=leg.txt, pch=leg.pch, col=leg.col, cex=.75)


## ------------------------------------------------------------------------
# Using Smax=10 here to illustrate calculation for first 25 species in neutral assemblage
options(warn = -1)
metrics <- calc_metrics(samples=neutral_sample, Smax=10, Model="Neutral")
metrics

## ------------------------------------------------------------------------
# Calculate statistics for just the entire sample
options(warn = -1)
metrics <- calc_metrics(samples=neutral_sample, increm=FALSE)
metrics

## ------------------------------------------------------------------------
# Using Smax=10 here to illustrate calculation for first 10 species in neutral assemblage
options(warn = -1)
metrics <- calc_metrics(samples=neutral_sample, Smax=10, Model="Neutral", increm=TRUE)
metrics

## ---- fig.width = 5, fig.height=5----------------------------------------
nreps <- 1:25 # A sequence of the samples to be simulated
n.samples <- lapply(X=nreps, FUN=neutral, Sseed=3, Smax=20, ecospace)

# Calculate functional diversity metrics for simulated samples
n.metrics <- lapply(X=nreps, FUN=calc_metrics, samples=n.samples, Model="neutral", Param="NA")

# Combine lists together into a single dataframe (the function is new to this package)
all <- rbind_listdf(n.metrics)

# Calculate mean dynamics across simulations
means <- n.metrics[[1]]
for(n in 1:20) means[n,4:11] <- apply(all[which(all$S==means$S[n]),4:11], 2, mean, na.rm=TRUE)

# Plot statistics as function of species richness, overlaying mean dynamics
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

