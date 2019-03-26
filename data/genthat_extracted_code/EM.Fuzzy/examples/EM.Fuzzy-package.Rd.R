library(EM.Fuzzy)


### Name: EM.Fuzzy-package
### Title: EM Algorithm for Maximum Likelihood Estimation by Non-Precise
###   Information
### Aliases: EM.Fuzzy-package EM.Fuzzy

### ** Examples

    library(FuzzyNumbers)
    library(DISTRIB, warn.conflicts = FALSE)

    # Let us we are going to estimation the unknown mean of Normal population with known variance 
    # (e.g, sd(X) = 0.5) on the basis of 11 trapezoidal fuzzy numbers (which we simulate them in 
    # bellow for simplification).
    n = 11
    set.seed(1000)
    c1 = rnorm(n, 10,.5)
    c2 = rnorm(n, 10,.5)
    for(i in 1:n) {if (c1[i] > c2[i]) { zarf <- c1[i]; c1[i] <- c2[i]; c2[i] <- zarf }}
    round(c1,3); round(c2,3)
    c1 <= c2
    l = runif(n, 0,1); round(l,3)
    u = runif(n, 0,1); round(u,3)

    ## No test: 
        EM.Trapezoidal(T.dist="norm", T.dist.par=c(NA,0.5), par.space=c(-5,30), c1, c2, l, u,
          start=4, ebs=.0001, fig=2)
    
## End(No test)



