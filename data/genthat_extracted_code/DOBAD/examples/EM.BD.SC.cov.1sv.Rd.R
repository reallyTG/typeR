library(DOBAD)


### Name: EM.BD.SC.cov.1sv
### Title: Expectation-Maximization on Linear Birth Death (and constrained
###   Immigration) with Covariates
### Aliases: EM.BD.SC.cov.1sv

### ** Examples


library(Matrix)
library(functional)



set.seed(1234)
mm <- 30; ## num individuals. arbitrary.
pp <- 2; ## num covariates, = HALF the number parameters
ZZ <- matrix(rnorm(mm*pp, -2, .5), nrow=mm, ncol=pp); ## arbitrary ...
ZZ.l1 <- apply(ZZ, 1, Compose(sum,abs))
coefs0.LL <- rnorm(pp, 0, 1)
ZZ <- (1/ZZ.l1)*ZZ ## will need |coefs.LL_j-coefs0.MM.j|< logKK / max( ||z_i||_1)
KK <- 2
diffs0 <- (rbeta(pp, 2,2)-1/2) * log(KK) ## want |lambda-mu| within a factor of KK
coefs0.MM <- coefs0.LL+diffs0;
coefs0 <- matrix(c(coefs0.LL, coefs0.MM), nrow=pp,ncol=2)
theta0 <- exp(ZZ %*% coefs0);
initstates <- rpois(mm, 3)+1
Ts <- abs(rnorm(mm,1,1)) / (theta0[,1]*initstates)
bb <- 1.1; ##beta
arg <- cbind(Ts,theta0, bb*coefs0.LL, initstates);
colnames(arg) <- NULL
BDMCs <- apply(arg, 1,
function(aa){birth.death.simulant(aa[1],aa[5], aa[2],aa[3],aa[4])})
t.obs <- apply(cbind(rpois(mm,2)+2, Ts), 1,
 function(aa){sort(runif(aa[1], 0, aa[2]))}) ##at least 2 observs
BDMCs.PO <- apply(cbind(t.obs,BDMCs), 1,
function(aa){getPartialData(aa[[1]],aa[[2]])})
BDMCs.PO <- new("CTMC_PO_many", BDMCsPO=BDMCs.PO);



#### Run the EM: (commented for speed for CRAN checks)
##emRes1 <- EM.BD.SC.cov.1sv(BDMCs.PO,
##                           ZZ.LL=ZZ, ZZ.MM=ZZ,
##                           coefs.LL.init=coefs0.LL, ##initialize at truth (which are not MLEs)
##                           coefs.MM.init=coefs0.MM,
##                           tol=1e-4,
##                           M=2, ## for speed; increase.
##                           beta.immig=bb,
##                           dr=1e-7, n.fft=1024, r=4,
##                          prec.tol=1e-12, prec.fail.stop=TRUE,
##                           verbose=1, verbFile="BD_EM_covariates_tutorial.txt")





