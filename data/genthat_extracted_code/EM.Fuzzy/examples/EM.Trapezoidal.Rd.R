library(EM.Fuzzy)


### Name: EM.Trapezoidal
### Title: MLE by EM algorithm based on Trapezoidal Fuzzy Data
### Aliases: EM.Trapezoidal
### Keywords: TrapezoidalFuzzyNumber EM algorithm Fuzzy Data Maximum
###   Likelihood Estimation

### ** Examples

    library(FuzzyNumbers)
    library(DISTRIB, warn.conflicts = FALSE)

    # Example 1: Estimation the unknown mean of Normal population with known variance (e.g, 
    # var=0.5^2) based of Trapezoidal FNs.
    n = 2
    set.seed(1000)
    c1 = rnorm(n, 10,.5)
    c2 = rnorm(n, 10,.5)
    for(i in 1:n) {if (c1[i] > c2[i]) { zarf <- c1[i]; c1[i] <- c2[i]; c2[i] <- zarf }}
    round(c1,3); round(c2,3)
    c1 <= c2
    l = runif(n, 0,1); round(l,3)
    u = runif(n, 0,1); round(u,3)
    
    EM.Trapezoidal(T.dist="norm", T.dist.par=c(NA,0.5), par.space=c(-5,30), c1, c2, l, u, start=4,
    ebs=.1, fig=2)


    ## No test: 
        # Example 2: 
        n = 4	
        set.seed(10)
        c1 = rexp(n, 2)
        c2 = rexp(n, 2)
        for(i in 1:n) {if (c1[i] > c2[i]) { zarf <- c1[i]; c1[i] <- c2[i]; c2[i] <- zarf }}
        round(c1,3); round(c2,3)
        c1 <= c2
        l = runif(n, 0,1); round(l,3)
        u = runif(n, 0,2); round(u,3)

        EM.Trapezoidal(T.dist="exp", T.dist.par=NA, par.space=c(.1,20), c1, c2, l, u, start=7, 
          ebs=.001)


        # Example 3: Estimation the unknown standard deviation of Normal population with known 
        #  mean (e.g, mean=7) based of Trapezoidal FNs.
        n = 10	
        set.seed(123)
        c1 = rnorm(n, 4,1)
        c2 = rnorm(n, 4,1)
        for(i in 1:n) {if (c1[i] > c2[i]) { zarf <- c1[i]; c1[i] <- c2[i]; c2[i] <- zarf }}
        round(c1,3); round(c2,3)
        c1 <= c2
        l = runif(n, 0,.5); round(l,3)
        u = runif(n, 0,.75); round(u,3)

        EM.Trapezoidal(T.dist="norm", T.dist.par=c(4,NA), par.space=c(0,40), c1, c2, l, u, start=1,
         ebs=.0001, fig=2)


        # Example 4: Estimation alpha parameter in Beta distribution.
        n = 4	
        set.seed(12)
        c1 = rbeta(n, 2,1)
        c2 = rbeta(n, 2,1)
        for(i in 1:n) {if (c1[i] > c2[i]) { zarf <- c1[i]; c1[i] <- c2[i]; c2[i] <- zarf }}
        round(c1,3); round(c2,3)
        c1 <= c2
        l = rbeta(n, 1,1); round(l,3)
        u = rbeta(n, 1,1); round(u,3)

        EM.Trapezoidal(T.dist="beta", T.dist.par=c(NA,1), par.space=c(0,10), c1, c2, l, u, start=1,
         ebs=.01, fig=2)
    
## End(No test)



