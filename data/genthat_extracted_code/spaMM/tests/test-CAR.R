cat("\ntest CAR and SEM:\n")

data("scotlip")

# see also 'old donttest' examples

## same without optim: run in scotlip examples; cf also autoregressive.Rd for ML fits

#set.seed(124)
#eigenv <- sym_eigen(Nmatrix) ## could use eigen(,symmetric=TRUE)
set.seed(129) ## mayny samples will diverge (ML on binary response) or undemonstratively fit for extreme rho values
eigenv <- eigen(Nmatrix, symmetric=TRUE) 
Lmat <- eigenv$vectors %*% diag(sqrt(1/(1-0.17*eigenv$values)))
lp <- 0.1 + 3* Lmat %*% rnorm(ncol(Lmat)) ## single intercept beta =0.1; lambda=3
resp <- rbinom(ncol(Lmat),1,1/(1+exp(-lp)))
donn <- data.frame(npos=resp,nneg=1-resp,gridcode=scotlip$gridcode)

if (FALSE) { ## HLCor/corrHlfit already compared on scotlip by test-spaMM.R
  # corrHLfit without corners was poor here
  # CAR by Laplace with 'outer' estimation of rho
  # *** fitme is not very convicing, stops early ***
  blob <- fitme(cbind(npos,nneg)~1 +adjacency(1|gridcode),
                    adjMatrix=Nmatrix,family=binomial(probit),data=donn,method="ML",control.HLfit = list(LevenbergM=FALSE)) 
  AIC(blob)
}

# CAR by Laplace with 'inner' estimation of rho
blob <- HLCor(cbind(npos,nneg)~1 +adjacency(1|gridcode),
          adjMatrix=Nmatrix,family=binomial(probit),data=donn,HLmethod="ML",control.HLfit = list(LevenbergM=FALSE)) ## 2 s.
AIC(blob)

if (file.exists((privtest <- "C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_other_pack/test-probitgem.R"))) {
  source(privtest)
}
