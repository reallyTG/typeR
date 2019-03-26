library(ecospace)


### Name: partitioning
### Title: Use Partitioning Rule to Simulate Ecological Diversification of
###   a Biota.
### Aliases: partitioning

### ** Examples

# Create an ecospace framework with 15 3-state factor characters
# Can also accept following character types: "numeric", "ord.num", "ord.fac"
nchar <- 15
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep("factor", nchar))

# Single (default) sample produced by partitioning function (with strength=1 and
#   "strict" partitioning rules):
Sseed <- 5
Smax <- 50
x <- partitioning(Sseed=Sseed, Smax=Smax, ecospace=ecospace, rule="strict")
head(x, 10)

# Plot results, showing order of assembly
# (Seed species in red, next 5 in black, remainder in gray)
# Notice the 'strict' partitioning model produces an ecospace with life-habit gradients
#   between seed species
seq <- seq(nchar)
types <- sapply(seq, function(seq) ecospace[[seq]]$type)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Partitioning model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Same, but following "relaxed" partitioning rules:
# Notice the 'relaxed' partitioning model only fills in the ecospace between seed species
x <- partitioning(Sseed=Sseed, Smax=Smax, ecospace=ecospace, rule="relaxed")
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Partitioning model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Change strength parameter so rules followed 95% of time:
x <- partitioning(Sseed=Sseed, Smax=Smax, ecospace=ecospace, strength=0.95, rule="strict")
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Partitioning model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Create 5 samples using multiple nreps and lapply (can be slow)
nreps <- 1:5
samples <- lapply(X=nreps, FUN=partitioning, Sseed=5, Smax=50, ecospace)
str(samples)




