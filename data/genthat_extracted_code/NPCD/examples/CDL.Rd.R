library(NPCD)


### Name: CDL
### Title: Log-likelihood for cognitive diagnostic models
### Aliases: CDL

### ** Examples

# Generate item and examinee profiles

nitem <- 4
Q <- rbind(c(1, 0, 0), c(0, 1, 0), c(0, 0, 1), c(1, 1, 1))
alpha <- c(1, 0, 0)

# Generate DINA model-based response data

slip <- rep(0.1, nitem)
guess <- rep(0.1, nitem)
my.par <- list(slip=slip, guess=guess)

data <- NA
eta <- NA

for (i in 1:nitem) {
  eta[i] <- prod(alpha ^ Q[i, ])
  P <- (1 - slip[i]) ^ eta[i] * guess[i] ^ (1 - eta[i])
  u <- runif(1)
  data[i] <- as.numeric(u < P)
}

# Using the function to compute the log-likelihood of the given data

CDL(data, Q, my.par, alpha, model="DINA", undefined.flag=rep(0, nitem))



