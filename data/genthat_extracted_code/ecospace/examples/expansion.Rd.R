library(ecospace)


### Name: expansion
### Title: Use Expansion Rule to Simulate Ecological Diversification of a
###   Biota.
### Aliases: expansion

### ** Examples

# Create an ecospace framework with 15 3-state factor characters
# Can also accept following character types: "numeric", "ord.num", "ord.fac"
nchar <- 15
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep("factor", nchar))

# Single (default) sample produced by expansion function (with strength=1):
Sseed <- 5
Smax <- 50
x <- expansion(Sseed=Sseed, Smax=Smax, ecospace=ecospace)
head(x, 10)

# Plot results, showing order of assembly
# (Seed species in red, next 5 in black, remainder in gray)
# Notice that new life habits progressively expand outward into previously
#   unoccupied portions of ecospace
seq <- seq(nchar)
types <- sapply(seq, function(seq) ecospace[[seq]]$type)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Expansion model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Change strength parameter so rules followed 95% of time:
x <- expansion(Sseed=Sseed, Smax=Smax, ecospace=ecospace, strength=0.95)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Expansion model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Create 5 samples using multiple nreps and lapply (can be slow)
nreps <- 1:5
samples <- lapply(X=nreps, FUN=expansion, Sseed=5, Smax=50, ecospace)
str(samples)




