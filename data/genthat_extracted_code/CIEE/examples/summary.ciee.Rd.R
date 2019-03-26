library(CIEE)


### Name: summary.ciee
### Title: Summary function.
### Aliases: summary.ciee

### ** Examples


maf <- 0.2
n <- 1000
dat <- generate_data(n = n, maf = maf)
datX <- data.frame(X = dat$X)
names(datX)[1] <- "X1"
for (i in 2:10){
  X <- stats::rbinom(n, size = 2, prob = maf)
  datX$X <- X
  names(datX)[i] <- paste("X", i, sep="")
}

results1 <- ciee(Y = dat$Y, X = datX$X1, K = dat$K, L = dat$L)
summary(results1)

results2 <- ciee_loop(Y = dat$Y, X = datX, K = dat$K, L = dat$L)
summary(results2)




