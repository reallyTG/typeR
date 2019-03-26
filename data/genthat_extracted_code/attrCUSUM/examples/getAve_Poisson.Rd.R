library(attrCUSUM)


### Name: getAve_Poisson
### Title: Compute ATSs and Other Informations on (Zero-Inflated) Poisson
###   CUSUM Chart
### Aliases: getAve_Poisson getAve_pois getAve_zipois

### ** Examples

# Example 1: Reproduction of results from White et al. (1997)
tbl <- list()
arglist <- list(list(mu.a = 1, k = 2, h = 2),
                list(mu.a = 4, k = 5, h = 8),
                list(mu.a = 8, k = 10, h = 10),
                list(mu.a = 12, k = 15, h = 11))
deltas <- seq(0, 2.5, 0.5)
for(i in seq_along(arglist)) {
  argument <- arglist[[i]]
  arl <- numeric(length(deltas))
  for(j in seq_along(deltas)) {
    std.a <- sqrt(argument$mu.a)
    arl[j] <- getAve_pois(lambda = argument$mu.a + (std.a * deltas[j]),
                          refv = argument$k,
                          contl = argument$h)$ANSS
  }
  tbl[[i]] <- round(arl, 2)
}
tbl <- data.frame(tbl)
colnames(tbl) <- c("CUSUM(2,2)", "CUSUM(5,8)", "CUSUM(10,10)", "CUSUM(15,11)")
rownames(tbl) <- as.character(deltas)
cat("colnames stand for CUSUM(k,h)\n",
    "rownames stand for delta\n", sep = "")
tbl

# Example 2: ANSS profiles (h in seq(20L))
mu.a <-  4
k  <-  5
h <- seq(20)
ANSSs <- numeric(20)
for(i in seq(ANSSs)) {
  ANSSs[i] <- getAve_pois(lambda = mu.a, refv = k, contl = h[i], c.zero = 0,
                          warnl = 1, ds = 1)$ANSS
}
ANSSs




