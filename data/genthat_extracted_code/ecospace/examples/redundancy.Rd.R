library(ecospace)


### Name: redundancy
### Title: Use Redundancy Rule to Simulate Ecological Diversification of a
###   Biota.
### Aliases: redundancy

### ** Examples

# Create an ecospace framework with 15 3-state factor characters
# Can also accept following character types: "numeric", "ord.num", "ord.fac"
nchar <- 15
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep("factor", nchar))

# Single (default) sample produced by redundancy function (with strength=1):
Sseed <- 5
Smax <- 50
x <- redundancy(Sseed=Sseed, Smax=Smax, ecospace=ecospace)
head(x, 10)

# Plot results, showing order of assembly
# (Seed species in red, next 5 in black, remainder in gray)
# Notice the redundancy model produces an ecospace with discrete clusters of life habits
seq <- seq(nchar)
types <- sapply(seq, function(seq) ecospace[[seq]]$type)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Redundancy model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Change strength parameter so new species are 95% identical:
x <- redundancy(Sseed=Sseed, Smax=Smax, ecospace=ecospace, strength=0.95)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Redundancy model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Create 5 samples using multiple nreps and lapply (can be slow)
nreps <- 1:5
samples <- lapply(X=nreps, FUN=redundancy, Sseed=5, Smax=50, ecospace)
str(samples)




