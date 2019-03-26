library(RBesT)


### Name: pos1S
### Title: Probability of Success for a 1 Sample Design
### Aliases: pos1S pos1S.betaMix pos1S.normMix pos1S.gammaMix

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

# assume we would like to conduct at an interim analysis
# of PoS after having observed 20 events with a HR of 0.8.
# We first need the posterior at the interim ...
post_ia <- postmix(flat_prior, m=log(0.8), n=20)

# dual criterion
decComb <- decision1S(c(1-alpha, 0.5), c(theta_ni, theta_c), lower.tail=TRUE)

# ... and we would like to know the PoS for a successful
# trial at the end when observing 10 more events
pos_ia <- pos1S(post_ia, 10, decComb)

# our knowledge at the interim is just the posterior at
# interim such that the PoS is
pos_ia(post_ia)





