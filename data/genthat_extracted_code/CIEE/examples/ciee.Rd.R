library(CIEE)


### Name: ciee
### Title: CIEE: Causal inference based on estimating equations
### Aliases: ciee ciee_loop

### ** Examples


# Generate data under the GLM setting with default values
maf <- 0.2
n <- 100
dat <- generate_data(n = n, maf = maf)
datX <- data.frame(X = dat$X)
names(datX)[1] <- "X1"
# Add 9 more exposure variables names X2, ..., X10 to X
for (i in 2:10){
  X <- stats::rbinom(n, size = 2, prob = maf)
  datX$X <- X
  names(datX)[i] <- paste("X", i, sep="")
}

# Perform analysis of one exposure variable using all four methods
ciee(Y = dat$Y, X = datX$X1, K = dat$K, L = dat$L)

# Perform analysis of all exposure variables only for CIEE
ciee_loop(estimates = "ee", Y = dat$Y, X = datX, K = dat$K, L = dat$L)




