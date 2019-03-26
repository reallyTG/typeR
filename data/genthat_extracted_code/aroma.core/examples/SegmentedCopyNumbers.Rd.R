library(aroma.core)


### Name: SegmentedCopyNumbers
### Title: The SegmentedCopyNumbers class
### Aliases: SegmentedCopyNumbers
### Keywords: classes

### ** Examples

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Simulating copy-number data
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# True CN states
stateFcn <- function(x, ...) {
  states <- integer(length(x))
  states[200 <=x & x <= 300] <- -1L
  states[650 <=x & x <= 800] <- +1L
  states
}

# Number of loci
J <- 1000

y <- rnorm(J, sd=1/2)
x <- 1:length(y)
for (state in c(-1,+1)) {
  idxs <- (stateFcn(x) == state)
  y[idxs] <- y[idxs] + state
}


cn <- SegmentedCopyNumbers(y, x, states=stateFcn)
print(cn)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Subsetting
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
plot(cn, ylim=c(-4,4))
title("Copy numbers annotated by state (and subset by state)")

cnS <- extractSubsetByState(cn, states=c(0,+1L))
print(cnS)
points(cnS, pch=21, cex=1.2, lwd=2, col="purple")

legend("topright", pch=c(19, 21), col=c("#999999", "purple"),
       sprintf(c("raw [n=%d]", "CN in {0,1} [n=%d]"),
       c(nbrOfLoci(cn), nbrOfLoci(cnS))), bty="n")


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Kernel smoothing stratified by state
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
plot(cn, col="#999999", ylim=c(-3,3))
title(main="Kernel smoothing stratified by state w/ Gaussian kernel")

cnSa <- kernelSmoothingByState(cn, h=2)
points(cnSa, col="blue")

cnSb <- kernelSmoothingByState(cn, h=5)
points(cnSb, col="red")

legend("topright", pch=19, col=c("#999999", "blue", "red"),
       sprintf(c("raw [n=%d]", "N(.,sd=2) [n=%d]", "N(.,sd=5) [n=%d]"),
       c(nbrOfLoci(cn), nbrOfLoci(cnSa), nbrOfLoci(cnSb))), bty="n")


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Binned smoothing stratified by state
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
plot(cn, col="#999999", ylim=c(-3,3))
title(main="Binned smoothing stratified by state")

cnSa <- binnedSmoothingByState(cn, by=3, verbose=-1)
lines(cnSa, col="blue")
points(cnSa, col="blue")

cnSb <- binnedSmoothingByState(cn, by=9, verbose=-1)
lines(cnSb, col="red")
points(cnSb, col="red")

legend("topright", pch=19, col=c("#999999", "blue", "red"),
       sprintf(c("raw [n=%d]", "Bin(w=3) [n=%d]", "Bin(w=9) [n=%d]"),
       c(nbrOfLoci(cn), nbrOfLoci(cnSa), nbrOfLoci(cnSb))), bty="n")



