library(EM.Fuzzy)


### Name: EM.Triangular
### Title: MLE by EM algorithm based on Triangular Fuzzy Data
### Aliases: EM.Triangular
### Keywords: TriangularFuzzyNumber EM algorithm Fuzzy Data Maximum
###   Likelihood Estimation

### ** Examples

    library(FuzzyNumbers)
    library(DISTRIB, warn.conflicts = FALSE)

    # Example 1: 
    n = 2	
    set.seed(131)
    c = rexp(n, 2);    round(c,3)
    l = runif(n, 0,1); round(l,3)
    u = runif(n, 0,2); round(u,3)
 
    EM.Triangular(T.dist="exp", T.dist.par=NA, par.space=c(0,30), c, l, u, start=5, ebs=.1,
     fig=0)

    ## No test: 
        EM.Triangular(T.dist="exp", T.dist.par=NA, par.space=c(0,30), c, l, u, start=50, ebs=.001,
         fig=1) #Fast Convergence

        EM.Triangular(T.dist="exp", T.dist.par=NA, par.space=c(0,30), c, l, u, start=50, ebs=.1^6,
         fig=2)


        #Example 2:  Computing the mean and the standard deviation of 20 EM estimations:
        n = 15
        MLEs=c()
        for(j in 100:120){
                         print(j)
                         set.seed(j)
                         c = rexp(n, 2)
                         l = runif(n, 0,1)
                         u = runif(n, 0,2)
                         MLEs = c(MLEs, EM.Triangular(T.dist="exp", T.dist.par=NA, 
                                                      par.space=c(0,30), c, l, u, start=5, 
                                                      ebs=.01, fig=0)$MLE )
                         }

        MLEs       #  3.283703 2.475541 3.171026 ...
        mean(MLEs) # 2.263996
        sd(MLEs)   # 0.4952257
        hist(MLEs)


        # Example 3: Estimation the unknown mean of Normal population with known variance
        #  (e.g, var=1) based of TFNs.
        n = 5	
        set.seed(100)
        c = rnorm(n, 10,1);    round(c,3)
        l = runif(n, 0,1); round(l,3)
        u = runif(n, 0,1); round(u,3)

        EM.Triangular(T.dist="norm", T.dist.par=c(NA,1), par.space=c(-10,30), c, l, u, start=20,
          ebs=.001, fig=2)


        # Example 4: Estimation the unknown standard deviation of Normal population with known
        #  mean (e.g, mean=7) based of TFNs.
        n = 10	
        set.seed(123)
        c = rnorm(n, 7,2);    round(c,3)
        l = runif(n, 0,2.5); round(l,3)
        u = runif(n, 0,1); round(u,3)

        EM.Triangular(T.dist="norm", T.dist.par=c(7,NA), par.space=c(0,10), c, l, u, start=5,
          ebs=.0001, fig=2)


        # Example 5: Estimation the unknown parameter b where  X ~ U(a=0,b).
        n = 15	
        set.seed(101)
        c = runif(n, 0,5); round(c,3)
        l = runif(n, 0,1); round(l,3)
        u = runif(n, 0,1); round(u,3)

        b <- EM.Triangular(T.dist="unif", T.dist.par=c(0,NA), par.space=c(0,10), c, l, u,
                           start=5, ebs=.001, fig=2)$MLE
        print(b)
    
## End(No test)



