cat("\ntest pedigree:\n")

if(requireNamespace("pedigreemm", quietly=TRUE)) {
  ## derived from help("pedigreemm")
  p1 <- new("pedigree",
            sire = as.integer(c(NA,NA,1, 1,4,5)),
            dam  = as.integer(c(NA,NA,2,NA,3,2)),
            label = as.character(1:6))
  A <- pedigreemm::getA(p1) ## relationship matrix
  ## data simulation
  cholA <- chol(A)  
  varU <- 0.4; varE <- 0.6; rep <- 20
  n <- rep*6
  set.seed(108)
  bStar <- rnorm(6, sd=sqrt(varU))
  b <- crossprod(as.matrix(cholA),bStar)
  ID <- rep(1:6, each=rep)
  e0 <- rnorm(n, sd=sqrt(varE))
  y <- b[ID]+e0
  obs <- data.frame(y=y,IDgen=ID,IDenv=ID) ## two copies of ID for readability of GLMM results
  ## fits
  verif1 <- fitme(y ~ 1+ corrMatrix(1|IDgen) , corrMatrix=A,data=obs,method="ML") ## tests the full augZXy method
  testthat::expect_true(diff(c(logLik(verif1),-132.037970787))<1e-6)
  obs$y01 <- ifelse(y<1.3,0,1)
  verif2 <- fitme(y01 ~ 1+ corrMatrix(1|IDgen)+(1|IDenv), corrMatrix=A,data=obs, 
        family=binomial(), method="ML")
  testthat::expect_true(diff(range((c(logLik(verif2),-13.943504068))))<1e-6)
  ## test-adjacency-corrMatrix also tests variants of corrMatrix + covStruct, but is longer
  prec_mat <- solve(A)
  colnames(prec_mat) <- rownames(prec_mat) <- rownames(A) # important
  verif3 <- fitme(y01 ~ 1+ corrMatrix(1|IDgen)+(1|IDenv) , covStruct=list(precision=prec_mat),
                  data=obs,family=binomial(), method="ML")
  # or
  verif4 <- HLCor(y01 ~ 1+ corrMatrix(1|IDgen)+(1|IDenv) , covStruct=list(precision=prec_mat),
                  data=obs,family=binomial(), HLmethod="ML")
  testthat::expect_true(diff(range((c(logLik(verif2),logLik(verif3),logLik(verif4),-13.943504068))))<1e-6)
}
