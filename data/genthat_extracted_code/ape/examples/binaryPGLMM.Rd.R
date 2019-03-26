library(ape)


### Name: binaryPGLMM
### Title: Phylogenetic Generalized Linear Mixed Model for Binary Data
### Aliases: binaryPGLMM binaryPGLMM.sim print.binaryPGLMM
### Keywords: regression

### ** Examples

## Illustration of binaryPGLMM() with simulated data

# Generate random phylogeny

n <- 100
phy <- compute.brlen(rtree(n=n), method = "Grafen", power = 1)

# Generate random data and standardize to have mean 0 and variance 1
X1 <- rTraitCont(phy, model = "BM", sigma = 1)
X1 <- (X1 - mean(X1))/var(X1)

# Simulate binary Y
sim.dat <- data.frame(Y=array(0, dim=n), X1=X1, row.names=phy$tip.label)
sim.dat$Y <- binaryPGLMM.sim(Y ~ X1, phy=phy, data=sim.dat, s2=.5,
                             B=matrix(c(0,.25),nrow=2,ncol=1), nrep=1)$Y

# Fit model
binaryPGLMM(Y ~ X1, phy=phy, data=sim.dat)

## Not run: 
##D # Compare with phyloglm()
##D library(phylolm)
##D summary(phyloglm(Y ~ X1, phy=phy, data=sim.dat))
##D 
##D # Compare with glm() that does not account for phylogeny
##D summary(glm(Y ~ X1, data=sim.dat, family="binomial"))
##D 
##D # Compare with logistf() that does not account
##D # for phylogeny but is less biased than glm()
##D library(logistf)
##D logistf(Y ~ X1, data=sim.dat)
##D 
##D # Compare with MCMCglmm
##D library(MCMCglmm)
##D 
##D V <- vcv(phy)
##D V <- V/max(V)
##D detV <- exp(determinant(V)$modulus[1])
##D V <- V/detV^(1/n)
##D 
##D invV <- Matrix(solve(V),sparse=T)
##D sim.dat$species <- phy$tip.label
##D rownames(invV) <- sim.dat$species
##D 
##D nitt <- 43000
##D thin <- 10
##D burnin <- 3000
##D 
##D prior <- list(R=list(V=1, fix=1), G=list(G1=list(V=1, nu=1000, alpha.mu=0, alpha.V=1)))
##D summary(MCMCglmm(Y ~ X1, random=~species, ginvers=list(species=invV),
##D     data=sim.dat, slice=TRUE, nitt=nitt, thin=thin, burnin=burnin,
##D     family="categorical", prior=prior, verbose=FALSE))
##D 
##D ## Examine bias in estimates of B1 and s2 from binaryPGLMM with
##D # simulated data. Note that this will take a while.
##D 
##D Reps = 1000
##D 
##D s2 <- 0.4
##D B1 <- 1
##D 
##D meanEsts <- data.frame(n = Inf, B1 = B1, s2 = s2, Pr.s2 = 1, propconverged = 1)
##D 
##D for (n in c(160, 80, 40, 20)) {
##D 
##D   meanEsts.n <- data.frame(B1 = 0, s2 = 0, Pr.s2 = 0, convergefailure = 0)
##D     for (rep in 1:Reps) {
##D       phy <- compute.brlen(rtree(n = n), method = "Grafen", power = 1)
##D       X <- rTraitCont(phy, model = "BM", sigma = 1)
##D       X <- (X - mean(X))/var(X)
##D 
##D       sim.dat <- data.frame(Y = array(0, dim = n), X = X, row.names = phy$tip.label)
##D       sim <- binaryPGLMM.sim(Y ~ 1 + X, phy = phy, data = sim.dat, s2 = s2,
##D                                        B = matrix(c(0,B1), nrow = 2, ncol = 1), nrep = 1)
##D       sim.dat$Y <- sim$Y
##D 
##D       z <- binaryPGLMM(Y ~ 1 + X, phy = phy, data = sim.dat)
##D 
##D       meanEsts.n[rep, ] <- c(z$B[2], z$s2, z$P.H0.s2, z$convergeflag == "converged")
##D   }
##D converged <- meanEsts.n[,4]
##D meanEsts <- rbind(meanEsts,
##D                   c(n, mean(meanEsts.n[converged==1,1]),
##D                             mean(meanEsts.n[converged==1,2]),
##D                             mean(meanEsts.n[converged==1, 3] < 0.05),
##D                             mean(converged)))
##D }
##D meanEsts
##D 
##D # Results output for B1 = 0.5, s2 = 0.4; n-Inf gives the values used to
##D # simulate the data
##D #    n       B1        s2      Pr.s2 propconverged
##D # 1 Inf 1.000000 0.4000000 1.00000000         1.000
##D # 2 160 1.012719 0.4479946 0.36153072         0.993
##D # 3  80 1.030876 0.5992027 0.24623116         0.995
##D # 4  40 1.110201 0.7425203 0.13373860         0.987
##D # 5  20 1.249886 0.8774708 0.05727377         0.873
##D 
##D 
##D ## Examine type I errors for estimates of B0 and s2 from binaryPGLMM()
##D # with simulated data. Note that this will take a while.
##D 
##D Reps = 1000
##D 
##D s2 <- 0
##D B0 <- 0
##D B1 <- 0
##D 
##D H0.tests <- data.frame(n = Inf, B0 = B0, s2 = s2, Pr.B0 = .05,
##D                        Pr.s2 = .05, propconverged = 1)
##D for (n in c(160, 80, 40, 20)) {
##D 
##D   ests.n <- data.frame(B1 = 0, s2 = 0, Pr.B0 = 0, Pr.s2 = 0, convergefailure = 0)
##D   for (rep in 1:Reps) {
##D     phy <- compute.brlen(rtree(n = n), method = "Grafen", power = 1)
##D     X <- rTraitCont(phy, model = "BM", sigma = 1)
##D     X <- (X - mean(X))/var(X)
##D 
##D     sim.dat <- data.frame(Y = array(0, dim = n), X = X, row.names = phy$tip.label)
##D     sim <- binaryPGLMM.sim(Y ~ 1, phy = phy, data = sim.dat, s2 = s2,
##D                            B = matrix(B0, nrow = 1, ncol = 1), nrep = 1)
##D     sim.dat$Y <- sim$Y
##D 
##D     z <- binaryPGLMM(Y ~ 1, phy = phy, data = sim.dat)
##D 
##D     ests.n[rep, ] <- c(z$B[1], z$s2, z$B.pvalue, z$P.H0.s2, z$convergeflag == "converged")
##D   }
##D 
##D converged <- ests.n[,5]
##D H0.tests <- rbind(H0.tests,
##D                   c(n, mean(ests.n[converged==1,1]),
##D                     mean(ests.n[converged==1,2]),
##D                     mean(ests.n[converged==1, 3] < 0.05),
##D                     mean(ests.n[converged==1, 4] < 0.05),
##D                     mean(converged)))
##D }
##D H0.tests
##D 
##D # Results for type I errors for B0 = 0 and s2 = 0; n-Inf gives the values
##D # used to simulate the data. These results show that binaryPGLMM() tends to
##D # have lower-than-nominal p-values; fewer than 0.05 of the simulated
##D # data sets have H0:B0=0 and H0:s2=0 rejected at the alpha=0.05 level.
##D #     n            B0         s2      Pr.B0      Pr.s2 propconverged
##D # 1 Inf  0.0000000000 0.00000000 0.05000000 0.05000000         1.000
##D # 2 160 -0.0009350357 0.07273163 0.02802803 0.04804805         0.999
##D # 3  80 -0.0085831477 0.12205876 0.04004004 0.03403403         0.999
##D # 4  40  0.0019303847 0.25486307 0.02206620 0.03711133         0.997
##D # 5  20  0.0181394905 0.45949266 0.02811245 0.03313253         0.996
## End(Not run)


