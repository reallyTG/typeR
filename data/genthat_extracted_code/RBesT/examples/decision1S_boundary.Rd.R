library(RBesT)


### Name: decision1S_boundary
### Title: Decision Boundary for 1 Sample Designs
### Aliases: decision1S_boundary decision1S_boundary.betaMix
###   decision1S_boundary.normMix decision1S_boundary.gammaMix

### ** Examples


# non-inferiority example using normal approximation of log-hazard
# ratio, see ?decision1S for all details
s <- 2
flat_prior <- mixnorm(c(1,0,100), sigma=s)
nL <- 233
theta_ni <- 0.4
theta_a <- 0
alpha <- 0.05
beta  <- 0.2
za <- qnorm(1-alpha)
zb <- qnorm(1-beta)
n1 <- round( (s * (za + zb)/(theta_ni - theta_a))^2 )
theta_c <- theta_ni - za * s / sqrt(n1)

# double criterion design
# statistical significance (like NI design)
dec1 <- decision1S(1-alpha, theta_ni, lower.tail=TRUE)
# require mean to be at least as good as theta_c
dec2 <- decision1S(0.5, theta_c, lower.tail=TRUE)
# combination
decComb <- decision1S(c(1-alpha, 0.5), c(theta_ni, theta_c), lower.tail=TRUE)

# critical value of double criterion design
decision1S_boundary(flat_prior, nL, decComb)

# ... is limited by the statistical significance ...
decision1S_boundary(flat_prior, nL, dec1)

# ... or the indecision point (whatever is smaller)
decision1S_boundary(flat_prior, nL, dec2)




