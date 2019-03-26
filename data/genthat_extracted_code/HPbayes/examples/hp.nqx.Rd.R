library(HPbayes)


### Name: hp.nqx
### Title: Heligman-Pollard parameter conversion to age-specifc
###   probabilites of death
### Aliases: hp.nqx
### Keywords: misc

### ** Examples

theta <- cbind(0.06008, 0.31087, 0.34431, 0.00698,
           1.98569, 26.71071, 0.00022, 1.08800)
nqx <- hp.nqx(H.out=theta)



