library(NPCD)


### Name: AlphaNP
### Title: Nonparametric estimation of attribute profiles
### Aliases: AlphaNP

### ** Examples

# Generate item and examinee profiles

natt <- 3
nitem <- 4
nperson <- 5
Q <- rbind(c(1, 0, 0), c(0, 1, 0), c(0, 0, 1), c(1, 1, 1))
alpha <- rbind(c(0, 0, 0), c(1, 0, 0), c(0, 1, 0), c(0, 0, 1), c(1, 1, 1))

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

# Using the function to estimate examinee attribute profile

alpha.est.NP.H <- AlphaNP(data, Q, gate="AND", method="Hamming")
alpha.est.NP.W <- AlphaNP(data, Q, gate="AND", method="Weighted")
alpha.est.NP.P <- AlphaNP(data, Q, gate="AND", method="Penalized", wg=2, ws=1)

nperson <- 1   # Choose an examinee to investigate
print(alpha.est.NP.H) # Print the estimated examinee attribute profiles
plot(alpha.est.NP.H, nperson)   # Plot the sorted loss function of different 
#attribute profiles for this examinee
ItemFit(alpha.est.NP.H, model="DINA", par=list(slip=slip, guess=guess))
ItemFit(alpha.est.NP.W, model="DINA", par=list(slip=slip, guess=guess))
ItemFit(alpha.est.NP.P, model="DINA", par=list(slip=slip, guess=guess))



