library(PoSI)


### Name: PoSI
### Title: Valid Post-Selection Inference for Linear LS Models
### Aliases: PoSI summary.PoSI
### Keywords: Post-selection inference Family-wise error Model selection LS
###   Regression

### ** Examples


# Boston Housing data from http://archive.ics.uci.edu/ml/datasets/Housing
data(Boston, package="MASS")
.Random.seed <- 1:626
UL.Boston <- PoSI(Boston[,-14])
summary(UL.Boston)
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  3.593        4.904     4.729
    ## 99%  4.072        5.211     5.262


# Just 1 predictor:
.Random.seed <- 1:626
X.1 <- as.matrix(rnorm(100))
UL.max.1 <- PoSI(X.1)
summary(UL.max.1)             # Assuming sigma is known
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  1.960        1.960     1.960
    ## 99%  2.576        2.576     2.576
summary(UL.max.1, df.err=4)  # sigma estimated with 4 dfs
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  2.776        2.776     2.776
    ## 99%  4.604        4.604     4.604


# small N and automatic removal of intercept:
p <- 6;  N <- 4
.Random.seed <- 1:626
X.small <- cbind(1,matrix(rnorm(N*p), ncol=p))
UL.max.small <- PoSI(X.small, modelSZ=c(4,3,1), Nsim=1000, bundleSZ=5, verbose=2)
summary(UL.max.small, df.err=4)
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  4.226        9.256     4.447
    ## 99%  6.731       13.988     7.077


# Orthogonal regressors:
p <- 10; N <- 10
.Random.seed <- 1:626
X.orth <- qr.Q(qr(matrix(rnorm(p*N), ncol=p)))
UL.max.orth <- PoSI(X.orth, Nsim=10000)
summary(UL.max.orth)
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  3.448        4.422     4.113
    ## 99%  3.947        4.758     4.655


## Not run: 
##D # Large p=50, small N=20, models up to size 4:  1.3min
##D p <- 50;  N <- 20
##D .Random.seed <- 1:626
##D X.p50.N20 <- matrix(rnorm(p*N), ncol=p)
##D UL.max.p50.N20 <- PoSI(X.p50.N20, Nsim=1000, bundleSZ=100000, modelSZ=1:4) # 1.3 min (*)
##D summary(UL.max.p50.N20)
##D ##     K.PoSI K.Bonferroni K.Scheffe
##D ## 95##D 
##D ## 99##D 
## End(Not run)


# The following is modeled on a real data example:
p <- 84;  N <- 2758
.Random.seed <- 1:626
X.84 <- matrix(rnorm(p*N), ncol=p)
# --- (1) Rich submodels: sizes m=84 and m=83 with more simulations (10,000) for precision
UL.max.84 <- PoSI(X.84, Nsim=1000, bundleSZ=10000, modelSZ=c(p-1,p))  # 2 sec (*)
summary(UL.max.84)
    ##     K.PoSI K.Bonferroni K.Scheffe
    ## 95%  3.494        4.491    10.315
    ## 99%  3.936        4.823    10.819
## Not run: 
##D # --- (2) Sparse submodels: p=84, model size m=4, in p=d=84 dimensions:
##D # WARNING:  17 minutes (*)
##D UL.max.84.4 <- PoSI(X.84, Nsim=1000, bundleSZ=100000, modelSZ=4)
##D summary(UL.max.84.4)
##D     ##     K.PoSI K.Bonferroni K.Scheffe
##D     ## 95##D 
##D     ## 99##D 
##D summary(UL.max.84.4, df.err=2758-84-1)
##D     ##     K.PoSI K.Bonferroni K.Scheffe
##D     ## 95##D 
##D     ## 99##D 
## End(Not run)


## Not run: 
##D # Big experiment: full large PoSI for p=20
##D # WARNING: 13 minutes (*)
##D p <- 20;  N <- 1000
##D .Random.seed <- 1:626
##D X.p20 <- matrix(rnorm(N*p), ncol=p)
##D UL.max.p20 <- PoSI(X.p20, bundleSZ=100000)
##D summary(UL.max.p20)
##D     ##     K.PoSI K.Bonferroni K.Scheffe
##D     ## 95##D 
##D     ## 99##D 
##D summary(UL.max.p20, df.err=1000-21)
##D     ##     K.PoSI K.Bonferroni K.Scheffe
##D     ## 95##D 
##D     ## 99##D 
## End(Not run)


## Not run: 
##D # Big experiment: sparse large PoSI with p=50 and m=1:5:
##D ## WARNING: 22 minutes (*)
##D p <- 50;  N <- 1000;  m <- 1:5
##D .Random.seed <- 1:626
##D X.p50 <- matrix(rnorm(N*p), ncol=p)
##D UL.max.p50.m5 <- PoSI(X.p50, bundleSZ=100000, modelSZ=m)
##D summary(UL.max.p50.m5)
##D     ##    K.PoSI K.Bonferroni K.Scheffe
##D     ## 95##D 
##D     ## 99##D 
## End(Not run)


# Exchangeable Designs:
# function to create exchangeable designs:
design.exch <- function(p,a) { (1-a)*diag(p) + a*matrix(1,p,p) }
# example:
p <- 12;  a <- 0.5;
X.exch <- design.exch(p=p, a=a)
.Random.seed <- 1:626
UL.exch <- PoSI(X.exch, verbose=0, modelSZ=1:p)
summary(UL.exch)
    ##    K.PoSI K.Bonferroni K.Scheffe
    ## 95%  3.635        4.750     4.436
    ## 99%  4.129        5.066     4.972


# (*) Elapsed times were measured in R version 3.1.3, 32 bit,
#     on a processor Intel(R) Core(TM), 2.9 GHz, under Windows 7.
#     2015/04/16



