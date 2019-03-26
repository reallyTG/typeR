library(RBesT)


### Name: pos2S
### Title: Probability of Success for 2 Sample Design
### Aliases: pos2S pos2S.betaMix pos2S.normMix pos2S.gammaMix

### ** Examples


# see ?decision2S for details of example
priorT <- mixnorm(c(1,   0, 0.001), sigma=88, param="mn")
priorP <- mixnorm(c(1, -49, 20   ), sigma=88, param="mn")
# the success criteria is for delta which are larger than some
# threshold value which is why we set lower.tail=FALSE
successCrit  <- decision2S(c(0.95, 0.5), c(0, 50), FALSE)

# example interim outcome
postP_interim <- postmix(priorP, n=10, m=-50)
postT_interim <- postmix(priorT, n=20, m=-80)

# assume that mean -50 / -80 were observed at the interim for
# placebo control(n=10) / active treatment(n=20) which gives
# the posteriors
postP_interim
postT_interim

# then the PoS to succeed after another 20/30 patients is
pos_final <- pos2S(postP_interim, postT_interim, 20, 30, successCrit)

pos_final(postP_interim, postT_interim)




