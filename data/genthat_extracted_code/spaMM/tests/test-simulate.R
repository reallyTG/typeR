cat("\ntest-simulate:\n")
data("Loaloa")
HLC <- HLCor(cbind(npos,ntot-npos)~Matern(1|longitude+latitude),
             data=Loaloa,family=binomial(),
             ranPars=list(lambda=1,nu=0.5,rho=1/0.7)) 
testthat::expect_equal(dim(simulate(HLC, nsim=2)),c(197,2)) ## matrix 2 col -> OK
testthat::expect_equal(dim(simulate(HLC, nsim=1)),NULL) ## vector length N -> OK
testthat::expect_equal(dim(simulate(HLC, type = "residual", nsim=2)),c(197,2)) ## matrix 2 col -> OK
testthat::expect_equal(dim(simulate(HLC, type = "residual", nsim=1)),NULL) ## vector length N -> OK
testthat::expect_equal(dim(simulate(HLC, type = "(ranef|response)", nsim=2)),c(197,2)) ## matrix 2 col -> OK
testthat::expect_equal(dim(simulate(HLC, type = "(ranef|response)", nsim=1)),NULL) ## vector length N -> OK

