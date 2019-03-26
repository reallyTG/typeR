library(NPCD)


### Name: Qrefine
### Title: Refine the Q-matrix by minimizing the residual sum of square
###   (RSS)
### Aliases: Qrefine

### ** Examples

# Generate item and examinee profiles

natt <- 3
nitem <- 4
nperson <- 16
Q <- rbind(c(1, 0, 0), c(0, 1, 0), c(0, 0, 1), c(1, 1, 1))
alpha <- rbind(c(0, 0, 0), c(1, 0, 0), c(0, 1, 0), c(0, 0, 1), 
  c(1, 1, 0), c(1, 0, 1), c(0, 1, 1), c(1, 1, 1))
alpha <- rbind(alpha, alpha)

# Generate DINA model-based response data

slip <- c(0.1, 0.15, 0.2, 0.25)
guess <- c(0.1, 0.15, 0.2, 0.25)
my.par <- list(slip=slip, guess=guess)

data <- matrix(NA, nperson, nitem)
eta <- matrix(NA, nperson, nitem)

for (i in 1:nperson) {
  for (j in 1:nitem) {
  eta[i, j] <- prod(alpha[i,] ^ Q[j, ])
  P <- (1 - slip[j]) ^ eta[i, j] * guess[j] ^ (1 - eta[i, j])
  u <- runif(1)
  data[i, j] <- as.numeric(u < P)
  }
}

# Generate misspecified Q-matrix

Q_mis <- Q
Q_mis[c(1,2), 1] <- 1 - Q_mis[c(1,2), 1]

# Run Qrefine and create diagnostic plots

Qrefine.out <- Qrefine(data, Q_mis, gate="AND", max.ite=50)
print(Qrefine.out)
plot(Qrefine.out)



