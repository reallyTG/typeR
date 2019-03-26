library(RBesT)


### Name: oc2S
### Title: Operating Characteristics for 2 Sample Design
### Aliases: oc2S oc2S.betaMix oc2S.normMix oc2S.gammaMix

### ** Examples


# example from Schmidli et al., 2014
dec <- decision2S(0.975, 0, lower.tail=FALSE)

prior_inf <- mixbeta(c(1, 4, 16))
prior_rob <- robustify(prior_inf, weight=0.2, mean=0.5)
prior_uni <- mixbeta(c(1, 1,  1))

N <- 40
N_ctl <- N - 20

# compare designs with different priors
design_uni <- oc2S(prior_uni, prior_uni, N, N_ctl, dec)
design_inf <- oc2S(prior_uni, prior_inf, N, N_ctl, dec)
design_rob <- oc2S(prior_uni, prior_rob, N, N_ctl, dec)

# type I error
curve(design_inf(x,x), 0, 1)
curve(design_uni(x,x), lty=2, add=TRUE)
curve(design_rob(x,x), lty=3, add=TRUE)

# power
curve(design_inf(0.2+x,0.2), 0, 0.5)
curve(design_uni(0.2+x,0.2), lty=2, add=TRUE)
curve(design_rob(0.2+x,0.2), lty=3, add=TRUE)





