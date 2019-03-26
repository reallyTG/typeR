library(ecospace)


### Name: neutral
### Title: Use Neutral Rule to Simulate Ecological Diversification of a
###   Biota.
### Aliases: neutral

### ** Examples

# Create an ecospace framework with 15 3-state factor characters
# Can also accept following character types: "numeric", "ord.num", "ord.fac"
nchar <- 15
ecospace <- create_ecospace(nchar=nchar, char.state=rep(3, nchar),
  char.type=rep("factor", nchar))

# Single (default) sample produced by neutral function:
Sseed <- 5
Smax <- 50
x <- neutral(Sseed=Sseed, Smax=Smax, ecospace=ecospace)
head(x, 10)

# Plot results, showing order of assembly
# (Seed species in red, next 5 in black, remainder in gray)
# Notice the neutral model fills the entire ecospace with life habits
seq <- seq(nchar)
types <- sapply(seq, function(seq) ecospace[[seq]]$type)
if(any(types == "ord.fac" | types == "factor")) pc <- prcomp(FD::gowdis(x)) else
  pc <- prcomp(x)
plot(pc$x, type="n", main=paste("Neutral model,\n", Smax, "species"))
text(pc$x[,1], pc$x[,2], labels=seq(Smax), col=c(rep("red", Sseed), rep("black", 5),
  rep("slategray", (Smax - Sseed - 5))), pch=c(rep(19, Sseed), rep(21, (Smax - Sseed))),
  cex=.8)

# Create 5 samples using multiple nreps and lapply
nreps <- 1:5
samples <- lapply(X=nreps, FUN=neutral, Sseed=5, Smax=50, ecospace)
str(samples)

# Implement as simple permutation test by setting Sseed=Smax and providing species pool)
nchar <- 18
char.state <- c(2, 7, 3, 3, 2, 2, 5, 5, 2, 5, 2, 2, 5, 2, 5, 5, 3, 3)
char.type <- c("numeric", "ord.num", "numeric", "numeric", "numeric", "numeric",
  "ord.num", "ord.num", "numeric", "ord.num", "numeric", "numeric", "ord.num",
  "numeric", "ord.num", "numeric", "numeric", "numeric")
data(KWTraits)
ecospace <- create_ecospace(nchar, char.state, char.type, constraint=2,
  weight.file=KWTraits)

x <- neutral(Sseed=100, Smax=100, ecospace=ecospace)
mean(dist(x))

# Note ecological disparity (functional diversity) is less when perform permutation
x <- neutral(Sseed=5, Smax=100, ecospace=ecospace)
mean(dist(x))

# Simulated character states (functional traits) proportionally mimic those in species pool
x <- neutral(Sseed=5, Smax=234, ecospace=ecospace)
table(x[,1:2])
table(KWTraits$SEXL, KWTraits$ASEX)




