context("evmBoot")
test_that("evmBoot behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    Sys.setenv("R_TESTS" = "") # Prevent R CMD check failure with parallel
    tol <- 0.12
  
  for(Family in list(gpd,gev)){
    set.seed(20130615)
    
    pst <- function(msg) texmexPst(msg,Family=Family)
    
    u    <- switch(Family$name, GPD=30, GEV=-Inf)
    data <- switch(Family$name, GPD=rain, GEV=portpirie$SeaLevel)
    
    fit <- evm(data, th=u, family=Family, penalty="none")
    boot <- evmBoot(fit, R=200, trace=1000)
    co <- coef(fit)
    rep <- boot$replicates
    scaleColumn <- switch(Family$name, GPD=1, GEV=2)
    rep[, scaleColumn] <- exp(rep[, scaleColumn])
    
    # Compare bootstrap standard errors with those given by Coles
    # pages 59 and 85 for GEV and GPD resp
    
    bse <- apply(rep, 2, sd)
    cse <- switch(Family$name,GPD=c(.958432, .101151),GEV=c(0.02792848, 0.02024846, 0.09823441))
    
    expect_that(cse, equals(unname(bse), tolerance=tol),
                label=pst("evmBoot: bootstrap se of parameter estimates matches Coles"))
    
    ## Check penalization works - set harsh penalty and do similar
    ## checks to above
    
    pp <- switch(Family$name,GPD=list(c(0, .5), diag(c(.5, .05))), GEV=list(c(5, 0, .5), diag(c(.5, .5, .05))))
    fit <- evm(data, th=u, penalty="none", priorParameters=pp,family=Family)
    boot <- evmBoot(fit, R=1000, trace=1100)
    
    bse <- apply(boot$replicates, 2, sd)
    rse <- bse / fit$se
    rse <- ifelse(rse < 1, 1/rse, rse)
    expect_that(max(rse) < 1.1, is_true(), label=pst("evmBoot: SEs with xi in model, with penalty applied"))
    
    best <- apply(boot$replicates, 2, median)
    fest <- coef(fit)
    rdiff <- abs(best - fest)
    # Do 80% test
    expect_that(all(rdiff < 1.281552*fit$se), is_true(), label=pst("evmBoot: medians in line with point ests, with penalty applied"))
    
    ##################################################################
    # models with covariates. Due to apparent instability
    # of the Hessian in some cases, allow some leeway
    
    n <- 1000
    mu <- 1
    phi <- 5
    xi <- 0.05
    X <- data.frame(a = rnorm(n),b = runif(n,-0.1,0.1))
    th <- switch(Family$name,GPD=0,GEV=-Inf)
    
    test <- function(boot, fit, txt){
      bse <- apply(boot$replicates, 2, sd)
      rse <- bse / fit$se
      rse <- ifelse(rse < 1, 1/rse, rse)
      expect_that(max(rse) < 1.5, is_true(), label=pst(paste("evmBoot: SEs with covariates in", txt)))
      
      best <- apply(boot$replicates, 2, median)
      fest <- coef(fit)
      rdiff <- abs((best - fest)/fest)

      expect_that(all(rdiff < 0.25), is_true(), label=pst(paste("evmBoot:medians in line with point ests, covariates in", txt)))
    }
    
    param <- switch(Family$name, GPD=cbind(2 + X[, 1], xi), GEV=cbind(mu, 2 + X[, 1], xi))
    start <- switch(Family$name, GPD=c(2, 1, xi), GEV=c(mu, 2, 1, xi))
    X$Y <- Family$rng(n, param, list(threshold=th))
    
    fit <- evm(Y, data=X, phi=~a, th=th, family=Family, start=start)
    boot <- evmBoot(fit, R=200, trace=201)
    test(boot, fit, "phi")
    
    param <- switch(Family$name,GPD=cbind(phi,0.1+X[,2]),GEV=cbind(mu,phi,0.1+X[,2]))
    start <- switch(Family$name,GPD=c(phi,0.1,1),GEV=c(mu,phi,0.1,1))
    X$Y <- Family$rng(n,param,list(threshold=th))
    
    fit <- evm(Y,data=X,xi=~b,th=th,family=Family,start=start)
    boot <- evmBoot(fit, R=200, trace=201)
    test(boot,fit,"xi")
  }
}
)
