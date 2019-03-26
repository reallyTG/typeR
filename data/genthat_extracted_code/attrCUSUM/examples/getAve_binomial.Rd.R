library(attrCUSUM)


### Name: getAve_binomial
### Title: Compute ATSs and Other Informations on (Zero-Inflated) Binomial
###   CUSUM Chart
### Aliases: getAve_binom getAve_binomial getAve_zibinom

### ** Examples

# Example 1: Reproduction of results from Rakitzis et al. (2016)
rho <- 0.9
size <- 100
prob0 <- 0.01
refv <- 0.26
contl <- 3.86
deltas <- seq(1, 2, 0.1)
ANSSs <- numeric(length(deltas))
for(i in seq(deltas)) {
  prob1 <- deltas[i] * prob0
  ANSSs[i] <- getAve_zibinom(rho = rho, size = size, prob = prob1,
                             refv = refv, contl = contl)$ANSS
}
names(ANSSs) <- deltas
ANSSs <- round(ANSSs, 2)
ANSSs

# Example 2: ANSS profiles (h in seq(10L))
rho <- 0.9
size <- 100
prob0 <- 0.01
refv <- 0.26
h <- seq(10L)
ANSSs <- numeric(10)
for(i in seq(ANSSs)) {
  ANSSs[i] <- getAve_zibinom(rho = rho, size = size, prob = prob0,
                             refv = refv, contl = h[i], ds = 1)$ANSS
}
ANSSs




