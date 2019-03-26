library(RBesT)


### Name: likelihood
### Title: Read and Set Likelihood to the Corresponding Conjugate Prior
### Aliases: likelihood likelihood<-

### ** Examples


# Gamma mixture
gmix <- mixgamma(c(0.3, 20, 4), c(0.7, 50, 10))

# read out conjugate partner
likelihood(gmix)

ess(gmix)

# set conjugate partner
likelihood(gmix) <- "exp"

# ... which changes the interpretation of the mixture
ess(gmix)



