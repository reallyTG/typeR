library(RBesT)


### Name: oc1S
### Title: Operating Characteristics for 1 Sample Design
### Aliases: oc1S oc1S.betaMix oc1S.normMix oc1S.gammaMix

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

# standard NI design
decA <- decision1S(1 - alpha, theta_ni, lower.tail=TRUE)

# double criterion design
# statistical significance (like NI design)
dec1 <- decision1S(1-alpha, theta_ni, lower.tail=TRUE)
# require mean to be at least as good as theta_c
dec2 <- decision1S(0.5, theta_c, lower.tail=TRUE)
# combination
decComb <- decision1S(c(1-alpha, 0.5), c(theta_ni, theta_c), lower.tail=TRUE)

theta_eval  <- c(theta_a, theta_c, theta_ni)

# evaluate different designs at two sample sizes
designA_n1  <- oc1S(flat_prior, n1, decA)
designA_nL  <- oc1S(flat_prior, nL, decA)
designC_n1  <- oc1S(flat_prior, n1, decComb)
designC_nL  <- oc1S(flat_prior, nL, decComb)

# evaluate designs at the key log-HR of positive treatment (HR<1),
# the indecision point and the NI margin

designA_n1(theta_eval)
designA_nL(theta_eval)
designC_n1(theta_eval)
designC_nL(theta_eval)

# to understand further the dual criterion design it is useful to
# evaluate the criterions separatley:
# statistical significance criterion to warrant NI...
designC1_nL <- oc1S(flat_prior, nL, dec1)
# ... or the clinically determined indifference point
designC2_nL <- oc1S(flat_prior, nL, dec2)

designC1_nL(theta_eval)
designC2_nL(theta_eval)

# see also ?decision1S_boundary to see which of the two criterions
# will drive the decision





