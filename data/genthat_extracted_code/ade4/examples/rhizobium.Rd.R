library(ade4)


### Name: rhizobium
### Title: Genetic structure of two nitrogen fixing bacteria influenced by
###   geographical isolation and host specialization
### Aliases: rhizobium
### Keywords: datasets

### ** Examples


# The functions used below require the package ape
data(rhizobium)
if(requireNamespace("ape", quietly = TRUE)) {
dat <- prep.mdpcoa(rhizobium[[1]], rhizobium[[2]], 
    model = c("F84", "F84", "F84", "F81"),
    pairwise.deletion = TRUE)
sam <- dat$sam
dis <- dat$dis
# The distances should be Euclidean. 
# Several transformations exist to render a distance object Euclidean 
# (see functions cailliez, lingoes and quasieuclid in the ade4 package). 
# Here we use the quasieuclid function.
dis <- lapply(dis, quasieuclid)
mdpcoa1 <- mdpcoa(sam, dis, scann = FALSE, nf = 2)

# Reference analysis
plot(mdpcoa1)

# Differences between the loci
kplot(mdpcoa1)

# Alleles projected on the population maps.
kplotX.mdpcoa(mdpcoa1)
}




