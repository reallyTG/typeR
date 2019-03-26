library(RBesT)


### Name: decision1S
### Title: Decision Function for 1 Sample Designs
### Aliases: decision1S oc1Sdecision

### ** Examples


# see Neuenschwander et al., 2011

# example is for a time-to-event trial evaluating non-inferiority
# using a normal approximation for the log-hazard ratio

# reference scale
s <- 2
theta_ni <- 0.4
theta_a <- 0
alpha <- 0.05
beta  <- 0.2
za <- qnorm(1-alpha)
zb <- qnorm(1-beta)
n1 <- round( (s * (za + zb)/(theta_ni - theta_a))^2 )  # n for which design was intended
nL <- 233
c1 <- theta_ni - za * s / sqrt(n1)

# flat prior
flat_prior <- mixnorm(c(1,0,100), sigma=s)

# standard NI design
decA <- decision1S(1 - alpha, theta_ni, lower.tail=TRUE)

# for double criterion with indecision point (mean estimate must be
# lower than this)
theta_c <- c1

# double criterion design
# statistical significance (like NI design)
dec1 <- decision1S(1-alpha, theta_ni, lower.tail=TRUE)
# require mean to be at least as good as theta_c
dec2 <- decision1S(0.5, theta_c, lower.tail=TRUE)
# combination
decComb <- decision1S(c(1-alpha, 0.5), c(theta_ni, theta_c), lower.tail=TRUE)

theta_eval  <- c(theta_a, theta_c, theta_ni)

# we can display the decision function definition
decComb

# and use it to decide if a given distribution fulfills all
# criterions defined
# for the prior
decComb(flat_prior)
# or for a possible outcome of the trial
# here with HR of 0.8 for 40 events
decComb(postmix(flat_prior, m=log(0.8), n=40))





