library(mcompanion)


### Name: sim_mc
### Title: Simulate a multi-companion matrix
### Aliases: sim_mc
### Keywords: datagen

### ** Examples

m0 <- sim_mc(3,2)   # simulate 3x3 2-companion matrix
abs(m0$eigval)      # eigval random, so their abs values

# now fix moduli of eigenvalues, and
# ask for one real ev and one complex pair of ev's
m1 <- sim_mc(3,2,eigabs=c(0.25,0.5), type.eigval=c("r","cp"))
m1$eigval
abs(m1$eigval)

# same as above, since type.eigval happens to be the default
# dim is odd, by default first ev is real, rest are complex pairs
m1a <- sim_mc(3,2,eigabs=c(0.25,0.5))
m1a$eigval
abs(m1a$eigval)

# simulate 6x6 4-companion matrix
# with ev's at the seasonal frequencies (1.57 3.141593 -1.57)
# and random moduli. 3 complex pairs of ev's
m2 <- sim_mc(6,4, eigsign = pi*c(1/2,1,-1/2) )
Arg(m2$eigval)



